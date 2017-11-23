/* To avoid CSS expressions while still supporting IE 7 and IE 6, use this script */
/* The script tag referencing this file must be placed before the ending body tag. */

/* Use conditional comments in order to target IE 7 and older:
	<!--[if lt IE 8]><!-->
	<script src="ie7/ie7.js"></script>
	<!--<![endif]-->
*/

(function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'icomoon\'">' + entity + '</span>' + html;
	}
	var icons = {
		'icon-phone2': '&#xe908;',
		'icon-phone': '&#xe909;',
		'icon-restaurant_menu': '&#xe901;',
		'icon-restaurant': '&#xe902;',
		'icon-live_help': '&#xe900;',
		'icon-phone4': '&#xe90a;',
		'icon-info-circle': '&#xe907;',
		'icon-info-with-circle': '&#xe906;',
		'icon-phone3': '&#xe90b;',
		'icon-contact': '&#xe90b;',
		'icon-info2': '&#xe905;',
		'icon-info': '&#xe904;',
		'icon-file-text2': '&#xe926;',
		'icon-phone5': '&#xe942;',
		'icon-spoon-knife': '&#xe9a3;',
		'icon-truck': '&#xe9b0;',
		'icon-information': '&#xe903;',
		'0': 0
		},
		els = document.getElementsByTagName('*'),
		i, c, el;
	for (i = 0; ; i += 1) {
		el = els[i];
		if(!el) {
			break;
		}
		c = el.className;
		c = c.match(/icon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
}());
