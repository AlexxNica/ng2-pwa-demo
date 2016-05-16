OPTS=(
  "--language_in=ES6_STRICT"
  "--language_out=ES5"
  "--compilation_level=SIMPLE_OPTIMIZATIONS"
  "--js_output_file=dist/bundle.js"
  "--entry_point=built\$bootstrap"
  "--variable_renaming_report=dist/variable_renaming_report"
  "--property_renaming_report=dist/property_renaming_report"
  "--externs=vendor/zone_externs.js"
  "built/*.js"
  $(find node_modules/@angular/{core,common,compiler,platform-browser}/esm -name *.js)
  $(find node_modules/rxjs-es -name *.js)
)
set -ex
java -jar node_modules/google-closure-compiler/compiler.jar $(echo ${OPTS[*]})
