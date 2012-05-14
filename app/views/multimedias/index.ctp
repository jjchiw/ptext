<div class="multimedias index">
	<h2><?php __('Multimedias');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('pretext_id');?></th>
			<th><?php echo $this->Paginator->sort('type');?></th>
			<th><?php echo $this->Paginator->sort('url');?></th>
			<th><?php echo $this->Paginator->sort('description');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($multimedias as $multimedia):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $multimedia['Multimedia']['id']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($multimedia['Pretext']['title'], array('controller' => 'pretexts', 'action' => 'view', $multimedia['Pretext']['id'])); ?>
		</td>
		<td><?php echo $multimedia['Multimedia']['type']; ?>&nbsp;</td>
		<td><?php echo $multimedia['Multimedia']['url']; ?>&nbsp;</td>
		<td><?php echo $multimedia['Multimedia']['description']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $multimedia['Multimedia']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $multimedia['Multimedia']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $multimedia['Multimedia']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $multimedia['Multimedia']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
	));
	?>	</p>

	<div class="paging">
		<?php echo $this->Paginator->prev('<< ' . __('previous', true), array(), null, array('class'=>'disabled'));?>
	 | 	<?php echo $this->Paginator->numbers();?>
 |
		<?php echo $this->Paginator->next(__('next', true) . ' >>', array(), null, array('class' => 'disabled'));?>
	</div>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('New Multimedia', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Pretexts', true), array('controller' => 'pretexts', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Pretext', true), array('controller' => 'pretexts', 'action' => 'add')); ?> </li>
	</ul>
</div>