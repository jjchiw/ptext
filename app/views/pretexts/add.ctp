<div class="pretexts form">
<?php echo $this->Form->create('Pretext');?>
	<fieldset>
		<legend><?php __('Add Pretext'); ?></legend>
	<?php
		echo $this->Form->input('title');
		echo $this->Form->input('text');
		echo $this->Form->input('lat');
		echo $this->Form->input('lng');
		echo $this->Form->input('extra_title');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Pretexts', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Comments', true), array('controller' => 'comments', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Comment', true), array('controller' => 'comments', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Multimedias', true), array('controller' => 'multimedias', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Multimedia', true), array('controller' => 'multimedias', 'action' => 'add')); ?> </li>
	</ul>
</div>