module.exports = function(grunt) {

  grunt.initConfig({
    nodewebkit: {
      options: {
        build_dir: './build', // Where the build version of my node-webkit app is saved
        credits: './public/credits.html',
        mac_icns: './public/images/icon.icns', // Path to the Mac icon file
        mac: true, // We want to build it for mac
        win: true, // We want to build it for win
        linux32: true, // need linux32
        linux64: true, // need linux64
      },
      src: './public/**/*' // Your node-webkit app
    },
  });

  grunt.loadNpmTasks('grunt-node-webkit-builder');
  grunt.registerTask('default', ['nodewebkit']);

};
