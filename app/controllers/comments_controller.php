<?php
class CommentsController extends AppController {

	var $name = 'Comments';
	var $components = array('RequestHandler');
	var $helpers = array('Qrcode');
	
	function beforeFilter() {
		parent::beforeFilter(); 
		$this->Auth->allow(array('add', 'edit_location', 'printqr', 'download', 'printqrpdf', 'getAll'));
	}
	
	function printqr($id = null){
		$this->set('comment', $this->Comment->read(null, $id));
		$this->layout = '';
	}
	
	function printqrpdf($id = null){
		$this->set('comment', $this->Comment->read(null, $id));
		$this->layout = 'pdf';
		$this->render("printqr"); 
	}
	
	function download($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid comment', true));
			$this->redirect(array('action' => 'index'));
			return;
		}
		$comment = $this->Comment->read(null, $id);
        // Include Component 
        App::import('Component', 'Pdf'); 
        // Make instance 
        $Pdf = new PdfComponent(); 
        // Invoice name (output name) 
        $Pdf->filename = "30pre-textos-". $comment['Comment']['pretext_id'] ."-" . $comment['Comment']['ordinal']; // Without .pdf 
        // You can use download or browser here 
        $Pdf->output = 'download'; 
        $Pdf->init(); 
        // Render the view 
		$Pdf->process(Configure::read('app_url').'/comments/printqrpdf/'. $id); 
        $this->render(false); 
    } 

	function index() {
		$this->Comment->recursive = 0;
		$this->set('comments', $this->paginate());
	}
	
	function getAll() {
		Configure::write('debug', 0);

		$this->Comment->recursive = -0;
		$comments = $this->Comment->find('all');

		$this->header("Content-Type: application/json");
		$this->autoRender = false;
		$jsonResponse =  array('comments' => $comments);
		return(json_encode($jsonResponse));
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid comment', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('comment', $this->Comment->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Comment->create();
			if ($this->Comment->save($this->data)) {
			
				if($this->RequestHandler->isAjax()){
					Configure::write('debug', 0);
					$this->Comment->recursive = -1;
					$total = $this->Comment->find('count', array('conditions' => array('Comment.pretext_id' => $this->data['Comment']['pretext_id'])));
					$this->Comment->saveField('ordinal', $total);

					$this->header("Content-Type: application/json");
					$this->autoRender = false;
					$jsonResponse =  array('ordinal'=>$total, 'text' => $this->data['Comment']['text']);
					return(json_encode($jsonResponse));
				}
				else{
					$this->Session->setFlash(__('The comment has been saved', true));
					$this->redirect(array('action' => 'index'));
				}
			} else {
				$this->Session->setFlash(__('The comment could not be saved. Please, try again.', true));
			}
		}
		$pretexts = $this->Comment->Pretext->find('list');
		$this->set(compact('pretexts'));
	}
	
	
	
	function edit_location($id = null) {
		if (!empty($this->data)) {
		
			$commentIdArray = $this->Comment->find('first', array('fields' => array('Comment.id'), 'conditions' => array('Comment.pretext_id' => $this->data['Comment']['pretext_id'], 
			'Comment.ordinal' => $this->data['Comment']['ordinal'])));
		
			if($commentIdArray){
				$this->Comment->id = $commentIdArray['Comment']['id'];
			
				if ($this->Comment->save($this->data)) {
				
					if($this->RequestHandler->isAjax()){
						Configure::write('debug', 0);
						
						$this->header("Content-Type: application/json");
						$this->autoRender = false;
						$jsonResponse =  array('response'=>"success");
						return(json_encode($jsonResponse));
					}
				
				
					$this->Session->setFlash(__('The comment has been saved', true));
					$this->redirect(array('action' => 'index'));
				} else {
					$this->Session->setFlash(__('The comment could not be saved. Please, try again.', true));
				}
			} else {
				$this->Session->setFlash(__('Invalid comment', true));
				$this->redirect(array('action' => 'index'));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Comment->read(null, $id);
		}
		$pretexts = $this->Comment->Pretext->find('list');
		$this->set(compact('pretexts'));
	}
	

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid comment', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Comment->save($this->data)) {
				$this->Session->setFlash(__('The comment has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The comment could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Comment->read(null, $id);
		}
		$pretexts = $this->Comment->Pretext->find('list');
		$this->set(compact('pretexts'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for comment', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Comment->delete($id)) {
			$this->Session->setFlash(__('Comment deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Comment was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
