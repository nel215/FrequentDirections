module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      files: ['Gruntfile.coffee','src/**/*.coffee','test/**/*.coffee']
      tasks: ['coffee','simplemocha']

    coffee:
      compile:
        files:
          'lib/lib.js': 'src/*.coffee'
      options:
        bare: yes

    simplemocha:
      all:
        src: ['test/*.coffee']
      options:
        reporter: 'spec'

  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'simplemocha']