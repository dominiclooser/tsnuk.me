time = require 'time-grunt'
jit = require 'jit-grunt'

config =
    'gh-pages':
        options:
            base: 'www'
        src: '**/*'

    copy:
        main:
            src: ['images/*']
            expand: true
            dest: 'www/'
        
    stylus:
        main:
            src: 'styles/styles.styl'
            dest: 'www/styles/styles.css'
    yaml:
        main:
            expand: true
            src: '_data.yml'
            ext: '.json'
    watch:
        options:
            livereload: true
        yaml:
            files: ['**/*.yml']
            tasks: ['yaml']
        all:
            files: ['**/*.*']
            tasks: []

module.exports = (grunt) ->
    grunt.initConfig config
    time grunt
    jit grunt
    grunt.registerTask 'default', ['yaml', 'watch']
    grunt.registerTask 'finish', ['copy', 'stylus']