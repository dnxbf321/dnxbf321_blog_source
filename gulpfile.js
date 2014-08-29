/** 注解：
 * 依赖的写法
    /**
     * @requires a.js
     * @requires b.js
     *\/
 */

var gulp = require('gulp'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify'),
    cssmin = require('gulp-minify-css'),
    newer = require('gulp-newer'),
    resolveDependencies = require('gulp-resolve-dependencies'),
    prefixer = require('gulp-autoprefixer'),
    htmlmin = require('gulp-htmlmin'),
    prettify = require('gulp-prettify'),
    del = require('del');

gulp.task('scripts', function() {
    var uglifyOpts = {
        'mangle': {
            'except': ['require', 'exports', 'module']
        }
    };

    function mergeJs(filesSrc, destFile) {
        gulp.src(filesSrc)
            .pipe(newer('./public/js/' + destFile))
            .pipe(resolveDependencies().on('error', function(err) {
                console.log(err.message)
            }))
            .pipe(concat(destFile))
            .pipe(uglify(uglifyOpts))
            .pipe(gulp.dest('./public/js'));
    }

    //minify all js
    gulp.src([
        './public/**/*.js',
        '!./public/js/lib/**/*'
    ])
        .pipe(newer('./public/**/*.js'))
        .pipe(resolveDependencies().on('error', function(err) {
            console.log(err.message)
        }))
        .pipe(uglify(uglifyOpts))
        .pipe(gulp.dest('./public'));
});

gulp.task('styles', function() {
    var cssminOpts = {
        'keepSpecialComments': 0,
        'noAdvanced': true
    };

    function mergeStyles(filesSrc, destFile) {
        gulp.src(filesSrc)
            .pipe(newer('./public/css/' + destFile))
            .pipe(prefixer('last 2 versions', '> 10%', 'ie 9'))
            .pipe(concat(destFile))
            .pipe(cssmin(cssminOpts))
            .pipe(gulp.dest('./public/css'));
    }

    //minify all css
    gulp.src([
        './public/**/*.css',
        '!./public/css/lib/**/*'
    ])
        .pipe(newer('./public/**/*.css'))
        .pipe(prefixer('last 2 versions', '> 10%', 'ie 9'))
        .pipe(cssmin(cssminOpts))
        .pipe(gulp.dest('./public'));
});

gulp.task('html', function() {
    // minify and prettify for public html
    gulp.src([
        './public/**/*.html'
    ])
        /*.pipe(prettify({
            'indent_inner_html': false,
            'indent_size': 4,
            'wrap_line_length': 1000,
            'preserve_newlines': false
        }))*/
        .pipe(htmlmin({
            'removeComments': true,
            'collapseWhitespace': true,
            'collapseBooleanAttributes': true,
            'useShortDoctype': true,
            'removeScriptTypeAttributes': true,
            'removeStyleLinkTypeAttributes': true,
            'keepClosingSlash': true,
            'minifyJS': {
                'mangle': {
                    'except': ['$', 'require', 'exports', 'module']
                }
            },
            'minifyCSS': {
                'keepSpecialComments': 0,
                'noAdvanced': true
            }
        }))
        .pipe(gulp.dest('./public'));
});

gulp.task('default', ['scripts', 'styles', 'html']);
