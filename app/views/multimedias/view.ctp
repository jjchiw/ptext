<div class="multimedias view">
<h2><?php  __('Multimedia');?></h2>
	<dl><?php $i = 0; $class = ' class="altrow"';?>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Id'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $multimedia['Multimedia']['id']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Pretext'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $this->Html->link($multimedia['Pretext']['title'], array('controller' => 'pretexts', 'action' => 'view', $multimedia['Pretext']['id'])); ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Type'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $multimedia['Multimedia']['type']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Url'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $multimedia['Multimedia']['url']; ?>
			&nbsp;
		</dd>
		<dt<?php if ($i % 2 == 0) echo $class;?>><?php __('Description'); ?></dt>
		<dd<?php if ($i++ % 2 == 0) echo $class;?>>
			<?php echo $multimedia['Multimedia']['description']; ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Multimedia', true), array('action' => 'edit', $multimedia['Multimedia']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('Delete Multimedia', true), array('action' => 'delete', $multimedia['Multimedia']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $multimedia['Multimedia']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Multimedias', true), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Multimedia', true), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Pretexts', true), array('controller' => 'pretexts', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Pretext', true), array('controller' => 'pretexts', 'action' => 'add')); ?> </li>
	</ul>
</div>
