SLACK_PATH='/Applications/Slack.app/Contents/Resources'
CSS_URL='https://raw.githubusercontent.com/RedcoatAsher/slack-dark-ui/master/css/gray.css'

if ! grep -q "$CSS_URL" "${SLACK_PATH}"/app.asar.unpacked/src/static/ssb-interop.js; then
bash -c "cat >> \"${SLACK_PATH}\"/app.asar.unpacked/src/static/ssb-interop.js" << EOF
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: '${CSS_URL}',
   success: function(css) {
     \$("<style></style>").appendTo('head').html(css)
   }
 });
});
EOF
fi

if ! grep -q "$CSS_URL" "${SLACK_PATH}"/app.asar.unpacked/src/static/index.js; then
bash -c "cat >> \"${SLACK_PATH}\"/app.asar.unpacked/src/static/index.js" << EOF
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: '${CSS_URL}',
   success: function(css) {
     \$("<style></style>").appendTo('head').html(css)
   }
 });
});
EOF
fi