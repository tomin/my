module.exports = function(grunt) {

    grunt.initConfig({
        options: {
            compress: {
                drop_console: true
            }
        },
        uglify: {
            my_target: {
                files: {
                    'js/prod.min.js': ['js/main.js']
                }
            }
        },
        cssmin: {
            combine: {
                options: {
                    keepSpecialComments: 0
                },
                files: {
                    'css/prod.min.css': ['css/jquery.fancybox.css', 'css/main.css']
                }
            }
        },
        compass: {
            dist: {
                options: {
                    sassDir: 'scss',
                    cssDir: 'css'
                }
            }
        },
        watch: {
            css: {
                files: '**/*.scss',
                tasks: ['compass']
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['watch']);
    grunt.registerTask('min', ['uglify', 'cssmin']);

};