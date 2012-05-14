<?php
class PretextsController extends AppController {

	var $name = 'Pretexts';
	var $helpers = array('Mobile');
	
	function beforeFilter() {
		parent::beforeFilter(); 
		$this->Auth->allow(array('view'));
	}

	function index() {
		$this->Pretext->recursive = 0;
		$this->set('pretexts', $this->paginate());
	}

	function view($title = null) {
		if (!$title) {
			$this->Session->setFlash(__('Invalid pretext', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('pretext', $this->Pretext->findByTitle($title));
		$this->layout = '';
	}

	function add() {
		if (!empty($this->data)) {
			$this->Pretext->create();
			if ($this->Pretext->save($this->data)) {
				$this->Session->setFlash(__('The pretext has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The pretext could not be saved. Please, try again.', true));
			}
		}
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid pretext', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Pretext->save($this->data)) {
				$this->Session->setFlash(__('The pretext has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The pretext could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Pretext->read(null, $id);
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for pretext', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Pretext->delete($id)) {
			$this->Session->setFlash(__('Pretext deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Pretext was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
