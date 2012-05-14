<div class="multimedias form">
<?php echo $this->Form->create('Multimedia');?>
	<fieldset>
		<legend><?php __('Add Multimedia'); ?></legend>
	<?php
		echo $this->Form->input('pretext_id');
		echo $this->Form->input('type');
		echo $this->Form->input('url');
		echo $this->Form->input('description');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Multimedias', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Pretexts', true), array('controller' => 'pretexts', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Pretext', true), array('controller' => 'pretexts', 'action' => 'add')); ?> </li>
	</ul>
</div>