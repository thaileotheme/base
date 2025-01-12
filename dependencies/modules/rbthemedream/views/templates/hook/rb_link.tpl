{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2019 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if !empty($rb_links)}
	{foreach $rb_links as $rb_link}
	    {if $rb_link.hook == 'displayNav1' || $rb_link.hook == 'displayNav2'}
	        <div class="block-rbthemedream block-rbthemedream-{$rb_link.id} block-links-inline d-inline-block">
	            <ul>
	                {foreach $rb_link.links as $link}
	                    {if isset($link.data.url) && isset($link.data.title)}
	                        <li>
	                            <a
	                                    href="{$link.data.url}"
	                                    {if isset($link.data.description)}title="{$link.data.description}"{/if}
	                            >
	                                {$link.data.title}
	                            </a>
	                        </li>
	                    {/if}
	                {/foreach}
	            </ul>
	        </div>
	    {elseif $rb_link.hook == 'displayLeftColumn' || $rb_link.hook == 'displayRightColumn'}
	        <div class="block block-toggle block-rbthemedream block-rbthemedream-{$rb_link.id} block-links js-block-toggle">
	            <h3 class="block-title"><span>{$rb_link.title}</span></h3>
	            <div class="block-content">
	                <ul>
	                    {foreach $rb_link.links as $link}
	                        {if isset($link.data.url) && isset($link.data.title)}
	                            <li>
	                                <a href="{$link.data.url}"
	                                   	{if isset($link.data.description)}title="{$link.data.description}"{/if}
	                                >
	                                    {$link.data.title}
	                                </a>
	                            </li>
	                        {/if}
	                    {/foreach}
	                </ul>
	            </div>
	        </div>
	    {else}
	        <div class="col-md-6 links">
	        	<div class="row">
	        		<div class="col-md-6 wrapper">
			            <p class="h3 hidden-sm-down">{$rb_link.title}</p>
			            <ul>
			                {foreach $rb_link.links as $link}
			                    {if isset($link.data.url) && isset($link.data.title)}
			                        <li>
			                            <a href="{$link.data.url}" {if isset($link.data.description)}title="{$link.data.description}"{/if}
			                            >
			                                {$link.data.title}
			                            </a>
			                        </li>
			                    {/if}
			                {/foreach}
			            </ul>
		            </div>
	            </div>
	        </div>
	    {/if}
	{/foreach}
{/if}

{if isset($type) && $type == 'contact'}
	{include 'module:rbthemedream/views/templates/hook/rb_info.tpl'}
{/if}