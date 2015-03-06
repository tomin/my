module.exports = function(grunt) {

    grunt.initConfig({
        options: {
            compress: {
                drop_console: true
            }
        },
        jade: {
            compile: {
                options: {
                    pretty: true
                },
                files: {
                    'jade/index.html': ['jade/index.jade']
                }
            }
        }

    });


    grunt.loadNpmTasks('grunt-contrib-jade');

    grunt.registerTask('default', ['jade']);
    grunt.registerTask('j', ['jade']);


};