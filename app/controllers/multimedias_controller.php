<?php
class MultimediasController extends AppController {

	var $name = 'Multimedias';

	function index() {
		$this->Multimedia->recursive = 0;
		$this->set('multimedias', $this->paginate());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid multimedia', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('multimedia', $this->Multimedia->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Multimedia->create();
			if ($this->Multimedia->save($this->data)) {
				$this->Session->setFlash(__('The multimedia has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The multimedia could not be saved. Please, try again.', true));
			}
		}
		$pretexts = $this->Multimedia->Pretext->find('list');
		$this->set(compact('pretexts'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid multimedia', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Multimedia->save($this->data)) {
				$this->Session->setFlash(__('The multimedia has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The multimedia could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Multimedia->read(null, $id);
		}
		$pretexts = $this->Multimedia->Pretext->find('list');
		$this->set(compact('pretexts'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for multimedia', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Multimedia->delete($id)) {
			$this->Session->setFlash(__('Multimedia deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Multimedia was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
