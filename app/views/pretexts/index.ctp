<div class="pretexts index">
	<h2><?php __('Pretexts');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('title');?></th>
			<th><?php echo $this->Paginator->sort('text');?></th>
			<th><?php echo $this->Paginator->sort('created');?></th>
			<th><?php echo $this->Paginator->sort('lat');?></th>
			<th><?php echo $this->Paginator->sort('lng');?></th>
			<th><?php echo $this->Paginator->sort('extra_title');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($pretexts as $pretext):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $pretext['Pretext']['id']; ?>&nbsp;</td>
		<td><?php echo $pretext['Pretext']['title']; ?>&nbsp;</td>
		<td><?php echo $pretext['Pretext']['text']; ?>&nbsp;</td>
		<td><?php echo $pretext['Pretext']['created']; ?>&nbsp;</td>
		<td><?php echo $pretext['Pretext']['lat']; ?>&nbsp;</td>
		<td><?php echo $pretext['Pretext']['lng']; ?>&nbsp;</td>
		<td><?php echo $pretext['Pretext']['extra_title']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $pretext['Pretext']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $pretext['Pretext']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $pretext['Pretext']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $pretext['Pretext']['id'])); ?>
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
		<li><?php echo $this->Html->link(__('New Pretext', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Comments', true), array('controller' => 'comments', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Comment', true), array('controller' => 'comments', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Multimedias', true), array('controller' => 'multimedias', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Multimedia', true), array('controller' => 'multimedias', 'action' => 'add')); ?> </li>
	</ul>
</div>