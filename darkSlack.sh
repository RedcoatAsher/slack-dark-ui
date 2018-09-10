SLACK_PATH='/Applications/Slack.app/Contents/Resources'
CSS_URL='https://raw.githubusercontent.com/RedcoatAsher/slack-dark-ui/master/css/black.css'

if ! grep -q "$CSS_URL" "${SLACK_PATH}"/app.asar.unpacked/src/static/ssb-interop.js; then
bash -c "cat >> \"${SLACK_PATH}\"/app.asar.unpacked/src/static/ssb-interop.js" << EOF

document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: 'https://cdn.rawgit.com/laCour/slack-night-mode/master/css/raw/black.css',
   success: function(css) {
     css += \`
       div.c-virtual_list__scroll_container {
           background-color: #3b3b3b !important;
       }
       .p-message_pane .c-message_list:not(.c-virtual_list--scrollbar), .p-message_pane .c-message_list.c-virtual_list--scrollbar > .c-scrollbar__hider {
            z-index: 0;
       }
       div.c-message__content:hover {
           background-color: #3b3b3b !important;
       }

       div.c-message:hover {
           background-color: #3b3b3b !important;
       }
	   a:link, a:visited {
		   color: #068bda;
	   }
       #footer {
           padding: 10pt 0 0 0;
       }
     \`;
     \$("<style></style>").appendTo('head').html(css);
   }
 });
});

EOF
fi
