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
<div class="rbblog__addComment">
	{if $customer.is_logged || Configuration::get('RBTHEMEBLOG_BLOG_COMMENT_ALLOW_GUEST')}
	    <h2 class="h2">{l s='New comment' mod='rbthemeblog'}</h2>

		<form class="rbblog__addComment__form" action="{$post->url|escape:'html':'UTF-8'}" method="post">
	        <div class="form-group">
	            <label class="col-12 form-control-label">
	                {l s='Your name' mod='rbthemeblog'}
	            </label>

	            <div class="col-12">
	                <input
	                	type="text"
	                	class="form-control"
	                	name="customer_name"
	                	id="customer_name"
	                	value="{if isset($logged) AND $logged}{$customerName|escape:'html':'UTF-8'}{else}{if isset($smarty.post.comment_content)}{$smarty.post.customer_name|escape:'htmlall':'UTF-8'}{/if}{/if}"
	                />
	            </div>
	        </div>

	        <div class="form-group">
	            <label class="col-12 form-control-label">
	                {l s='Your comment' mod='rbthemeblog'}
	            </label>

	            <div class="col-12">
	                <textarea class="form-control"id="comment_content" name="comment_content" rows="6">
	                	{if isset($smarty.post.comment_content)}
	                		{$smarty.post.comment_content|escape:'htmlall':'UTF-8'}
	                	{/if}
	                </textarea>
	            </div>
	        </div>

	        {if Configuration::get('RBTHEMEBLOG_BLOG_COMMENTS_RECAPTCHA')}
				<div class="form-group">
					<div
						class="g-recaptcha"
						data-sitekey="{Configuration::get('RBTHEMEBLOG_BLOG_COMMENTS_RECAPTCHA_SITE_KEY')}"
						data-theme="{Configuration::get('RBTHEMEBLOG_BLOG_COMMENTS_RECAPTCHA_THEME')}">
					</div>

					<script src='https://www.google.com/recaptcha/api.js'></script>
				</div>
			{/if}

	        <footer class="form-footer clearfix">
	            <input type="hidden" name="id_rbblog_post" value="{$post->id_rbblog_post|intval}"/>
				<input type="hidden" name="id_parent" id="id_parent" value="0" />

	            <button
	            	class="continue btn btn-primary float-xs-right"
	            	name="submitNewComment"
	            	type="submit"
	            	value="1"
	            >
	                {l s='Add new comment' mod='rbthemeblog'}
	            </button>
	        </footer>
	    </form>
	{else}
		<div class="warning alert alert-warning">
			<a href="{$link->getPageLink('authentication', true, null, array('back' => $post->url))|escape:'html':'UTF-8'}">
				{l s='Only registered and logged customers can add comments' mod='rbthemeblog'}
			</a>
		</div>
	{/if}
</div>