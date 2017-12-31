const gulp = require('gulp'),
    clean = require('gulp-clean'),
    riot = require('gulp-riot'),
    livereload = require('gulp-livereload'),
    webserver = require('gulp-webserver'),
    eslint = require('gulp-eslint'),
    rename = require('gulp-rename'),
    cssmin = require('gulp-cssmin'),
    uglify = require('gulp-uglify'),
    concat = require('gulp-concat'),
    svgSymbols = require('gulp-svg-symbols'),
    filter = require('gulp-filter'),
    svg2png = require('gulp-svg2png'),
    runSequence = require('run-sequence'),
    rev = require('gulp-rev'),
    revReplace = require('gulp-rev-replace'),
    replace = require('gulp-replace'),
    minimist = require('minimist'),
    imagemin = require('gulp-imagemin'),
    pngquant = require('imagemin-pngquant'),
    tinypng = require('gulp-tinypng-compress'),
    changed = require('gulp-changed'),
    shell = require('gulp-shell')
const options = minimist(process.argv.slice(2))
let VERSION = '0.0.0'

gulp.task('default', ['build'], () => {})

gulp.task('build', () => runSequence('clean', 'version', 'tags', 'js', 'config', 'index', 'css', 'lib', 'img', 'rev', 'rev-replace'))

gulp.task('webserver', () =>
    gulp.src('./dist')
    .pipe(webserver({
        livereload: true,
        open: 'http://dev-pay.xunyou.mobi:8080',
        port: 8080
    })))

gulp.task('watch', () => {
    gulp.watch('v1/**/*.{tag,js,css}', ['reload'])
    gulp.watch('v1/activitys/**/*', ['reload'])
    gulp.watch('v1/img/**/*', ['reload'])
})

gulp.task('clean', () =>
    gulp.src(['tmp', 'dist'], { read: false })
    .pipe(clean()))

gulp.task('version', () =>
    gulp.src('VERSION')
    .pipe(replace(/.*\..*\..*/g, version => {
        const v = version.split('=')[1]
        VERSION = v.split('.')[0] + '.' + v.split('.')[1] + '.' + (parseInt(v.split('.')[2]) + (options.r ? 1 : 0))
        return 'version=' + VERSION
    }))
    .pipe(gulp.dest('.'))
    .pipe(gulp.dest('dist'))
)

gulp.task('index', () =>
    gulp.src('v1/index.html')
    .pipe(replace('VERSION', VERSION))
    // .pipe(htmlmin({ collapseWhitespace: true }))
    .pipe(gulp.dest('dist')))

gulp.task('tags', () =>
    gulp.src('v1/tags/*.tag')
    .pipe(riot({
        'compact': true
    }))
    .pipe(uglify())
    .pipe(concat('tags.js'))
    .pipe(gulp.dest('tmp/js'))
    .pipe(eslint())
    .pipe(eslint.format())
    .pipe(eslint.failAfterError()))

gulp.task('js', () =>
    gulp.src('v1/js/app.js')
    .pipe(replace('VERSION', VERSION))
    .pipe(uglify())
    // .pipe(rename({ suffix: '.min' }))
    .pipe(gulp.dest('tmp/js'))
    .pipe(eslint())
    .pipe(eslint.format())
    .pipe(eslint.failAfterError()))

gulp.task('lib', () =>
    gulp.src('v1/lib/*.js')
    .pipe(gulp.dest('dist/lib')))

gulp.task('config', ['config-replace'], () =>
    gulp.src('v1/js/config.js.j2')
    .pipe(gulp.dest('dist/js')))

gulp.task('config-replace', () =>
    gulp.src('v1/js/config.js.j2')
    .pipe(replace('{{ api_base_url }}', options.t ? 'http://localhost:8881' : 'http://localhost:8080'))  // 修改host创造本地访问解决跨域问题，配置需要在CI上修改    
    .pipe(replace(/\n.*\{\%.*\%\}.*/g, ''))
    .pipe(rename('config.js'))
    .pipe(gulp.dest('dist/js/')))

gulp.task('css', () =>
    gulp.src('v1/css/*')
    .pipe(cssmin())
    // .pipe(rename({ 'suffix': '.min' }))
    .pipe(gulp.dest('tmp/css')))

gulp.task('img', () =>
    gulp.src('v1/img/**/*')
    .pipe(gulp.dest('dist/img')))


gulp.task('rev', () =>
    gulp.src(['tmp/css/*', 'tmp/js/*'], { base: 'tmp' })
    .pipe(rev())
    .pipe(gulp.dest('dist'))
    .pipe(rev.manifest())
    .pipe(gulp.dest('tmp')))

gulp.task('rev-replace', ['rev-js', 'rev-css'], () => {
    const manifest = gulp.src('tmp/rev-manifest.json')
    return gulp.src('dist/index.html')
        .pipe(revReplace({ manifest: manifest }))
        .pipe(gulp.dest('dist'))
})

gulp.task('rev-js', () => {
    const manifest = gulp.src('tmp/rev-manifest.json')
    return gulp.src('dist/js/*.js')
        .pipe(revReplace({ manifest: manifest }))
        .pipe(gulp.dest('dist/js'))
})

gulp.task('rev-css', () => {
    const manifest = gulp.src('dist/rev-manifest.json')
    return gulp.src('dist/css/*.css')
        .pipe(revReplace({ manifest: manifest }))
        .pipe(gulp.dest('dist/css'))
})

gulp.task('rev-tags', () => {
    const manifest = gulp.src('dist/rev-manifest.json')
    return gulp.src('dist/tags/*.tag')
        .pipe(revReplace({ manifest: manifest, replaceInExtensions: '.tag' }))
        .pipe(gulp.dest('dist/tags'))
})

gulp.task('test', shell.task([options.t && 'jasmine']))
