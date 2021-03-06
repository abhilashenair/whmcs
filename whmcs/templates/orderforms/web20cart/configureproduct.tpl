<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />

<div id="order-web20cart">

<h1>{$LANG.cartproductconfig}</h1>

<p>{$LANG.cartproductdesc}</p>

<form method="post" action="{$smarty.server.PHP_SELF}?a=confproduct&i={$i}">
<input type="hidden" name="configure" value="true">

{if $errormessage}
<div class="errorbox"><ul>{$errormessage}</ul></div>
{/if}

{if $productinfo}

<h3>{$LANG.orderproduct}</h3>
<div class="cartbox">
<strong>{$productinfo.groupname} - {$productinfo.name}</strong><br />
{$productinfo.description}
</div>

<input type="hidden" name="previousbillingcycle" value="{$billingcycle}" />
<h3>{$LANG.orderbillingcycle}</h3>
<div class="cartbox">{if $pricing.type eq "free"}
<input type="hidden" name="billingcycle" value="free" />
{$LANG.orderfree}
{elseif $pricing.type eq "onetime"}
<input type="hidden" name="billingcycle" value="onetime" />
{$pricing.onetime} {$LANG.orderpaymenttermonetime}
{else}
<select name="billingcycle" onchange="submit()">
{if $pricing.monthly}<option value="monthly"{if $billingcycle eq "monthly"} selected="selected"{/if}>{$pricing.monthly}</option>{/if}
{if $pricing.quarterly}<option value="quarterly"{if $billingcycle eq "quarterly"} selected="selected"{/if}>{$pricing.quarterly}</option>{/if}
{if $pricing.semiannually}<option value="semiannually"{if $billingcycle eq "semiannually"} selected="selected"{/if}>{$pricing.semiannually}</option>{/if}
{if $pricing.annually}<option value="annually"{if $billingcycle eq "annually"} selected="selected"{/if}>{$pricing.annually}</option>{/if}
{if $pricing.biennially}<option value="biennially"{if $billingcycle eq "biennially"} selected="selected"{/if}>{$pricing.biennially}</option>{/if}
{if $pricing.triennially}<option value="triennially"{if $billingcycle eq "triennially"} selected="selected"{/if}>{$pricing.triennially}</option>{/if}
</select>
{/if}
</div>
{/if}

{if $productinfo.type eq "server"}
<h3>{$LANG.cartconfigserver}</h3>
<table class="noborders">
<tr>
<td class="fieldlabel">{$LANG.serverhostname}:</td>
<td><input type="text" name="hostname" size="15" value="{$server.hostname}" /> eg. server1(.yourdomain.com)</td>
</tr>
<tr>
<td class="fieldlabel">{$LANG.serverns1prefix}:</td>
<td><input type="text" name="ns1prefix" size="10" value="{$server.ns1prefix}" /> eg. ns1(.yourdomain.com)</td>
</tr>
<tr>
<td class="fieldlabel">{$LANG.serverns2prefix}:</td>
<td><input type="text" name="ns2prefix" size="10" value="{$server.ns2prefix}" /> eg. ns2(.yourdomain.com)</td>
</tr>
<tr>
<td class="fieldlabel">{$LANG.serverrootpw}:</td>
<td><input type="password" name="rootpw" size="20" value="{$server.rootpw}" /></td>
</tr>
</table>
{/if}

{if $configurableoptions}
<h3>{$LANG.orderconfigpackage}</h3>
<p>{$LANG.cartconfigoptionsdesc}</p>
<div class="cartbox">
<table class="noborders">
{foreach key=num item=configoption from=$configurableoptions}
<tr>
<td class="fieldlabel">{$configoption.optionname}:</td>
<td>{if $configoption.optiontype eq 1}
<select name="configoption[{$configoption.id}]">
{foreach key=num2 item=options from=$configoption.options}
<option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>{$options.name}</option>
{/foreach}
</select>
{elseif $configoption.optiontype eq 2}
{foreach key=num2 item=options from=$configoption.options}
<label><input type="radio" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if}>
{$options.name}</label><br />
{/foreach}
{elseif $configoption.optiontype eq 3}
<label><input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked{/if}>
{$configoption.options.0.name}</label>
{elseif $configoption.optiontype eq 4}
<input type="text" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" size="5">
x {$configoption.options.0.name}
{/if}</td>
</tr>
{/foreach}
</table>
</div>
{/if}

{if $addons}
<h3>{$LANG.cartaddons}</h3>
<p>{$LANG.orderaddondescription}</p>
{foreach key=num item=addon from=$addons}
<div class="cartbox">
<label>{$addon.checkbox} <strong>{$addon.name}</strong>{if $addon.description} - {$addon.description}{/if} ({$addon.pricing})</label>
</div>
{/foreach}
{/if}

{if $customfields}
<h3>{$LANG.orderadditionalrequiredinfo}</h3>
<p>{$LANG.cartcustomfieldsdesc}</p>
<div class="cartbox">
<table class="noborders">
{foreach key=num item=customfield from=$customfields}
<tr><td class="fieldlabel">{$customfield.name}:</td><td>{$customfield.input}{if $customfield.description}<br />{$customfield.description}{/if}</td></tr>
{/foreach}
</table>
</div>
{/if}

<p align="center">{if $firstconfig}<input type="submit" value="{$LANG.addtocart}" />{else}<input type="submit" value="{$LANG.updatecart}" />{/if}</p>

</form>

</div>