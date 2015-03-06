<?php
/**
 * MyBB 1.6
 * Copyright 2010 MyBB Group, All Rights Reserved
 *
 * Website: http://mybb.com
 * License: http://mybb.com/about/license
 *
 * $Id: credits.php 5136 2010-07-28 17:46:03Z RyanGordon $
 */

// Disallow direct access to this file for security reasons
if(!defined("IN_MYBB"))
{
	die("Direct initialization of this file is not allowed.<br /><br />Please make sure IN_MYBB is defined.");
}

$page->add_breadcrumb_item($lang->mybb_credits, "index.php?module=home-credits");

$plugins->run_hooks("admin_home_credits_begin");

if(!$mybb->input['action'])
{
	$plugins->run_hooks("admin_home_credits_start");
	
	$page->output_header($lang->mybb_credits);
	
	$sub_tabs['credits'] = array(
		'title' => $lang->mybb_credits,
		'link' => "index.php?module=home-credits",
		'description' => $lang->mybb_credits_description
	);
	
	$sub_tabs['credits_about'] = array(
		'title' => $lang->about_the_team,
		'link' => "http://mybb.com/about/team",
		'link_target' => "_blank",
	);

	$page->output_nav_tabs($sub_tabs, 'credits');
	
	$table = new Table;
	$table->construct_header($lang->product_managers, array('width' => '15%'));
	$table->construct_header($lang->developers, array('width' => '15%'));
	$table->construct_header($lang->software_quality_assurance, array('width' => '20%'));
	$table->construct_header($lang->support_representative, array('width' => '20%'));
	$table->construct_header($lang->pr_liaison, array('width' => '15%'));
	
	$table->construct_cell("<a href=\"http://community.mybb.com/user-1.html\" target=\"_blank\">Chris Boulton</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-2165.html\" target=\"_blank\">Ryan Gordon</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-2824.html\" target=\"_blank\">Stefan T.</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-13556.html\" target=\"_blank\">Matt Rogowski</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-3971.html\" target=\"_blank\">Ryan Loos</a>");
	$table->construct_row();
	
	$table->construct_cell("<a href=\"http://community.mybb.com/user-81.html\" target=\"_blank\">Dennis Tsang</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-1830.html\" target=\"_blank\">Justin S.</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-1428.html\" target=\"_blank\">Nick P.</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-2249.html\" target=\"_blank\">Kevin Camps</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-6928.html\" target=\"_blank\">Imad Jomaa</a>");
	$table->construct_row();	
	
	$table->construct_cell("<a href=\"http://community.mybb.com/user-14.html\" target=\"_blank\">Alan Crisp</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-14621.html\" target=\"_blank\">Tom Moore</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-23449.html\" target=\"_blank\">Michael Malin</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-15525.html\" target=\"_blank\">Kieran Dunbar</a>");
	$table->construct_cell("&nbsp;");
	$table->construct_row();
	
	$table->construct_cell("<a href=\"http://community.mybb.com/user-27.html\" target=\"_blank\">Tom Huls</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-23291.html\" target=\"_blank\">Huji Lee</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-12241.html\" target=\"_blank\">Manuel Feller</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-8198.html\" target=\"_blank\">Tim B.</a>");
	$table->construct_cell("&nbsp;");
	$table->construct_row();
	
	$table->construct_cell("&nbsp;");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-13144.html\" target=\"_blank\">DougSD</a>");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-12694.html\" target=\"_blank\">Darkmew</a>");
	$table->construct_cell("&nbsp;");
	$table->construct_cell("&nbsp;");
	$table->construct_row();
	
	$table->construct_cell("&nbsp;");
	$table->construct_cell("&nbsp;");
	$table->construct_cell("<a href=\"http://community.mybb.com/user-1331.html\" target=\"_blank\">Chris W B.</a>");
	$table->construct_cell("&nbsp;");
	$table->construct_cell("&nbsp;");
	$table->construct_row();
	
	$table->output($lang->mybb_credits);
	
	$page->output_footer();
}

?>