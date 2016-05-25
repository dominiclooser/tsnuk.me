time = require 'time-grunt'
jit = require 'jit-grunt'

config =
    'gh-pages':
        options:
            base: 'www'
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