module.exports = (grunt) ->
  timestamp = Date.now().toString
  gitSha ='<%= gitinfo.local.branch.current.shortSHA %>'

  grunt.initConfig
    env: grunt.file.readJSON '.env.json'

    replace:
      prod:
        src: ['dist/*.html']
        overwrite: true
        replacements: [
          from: 'cloudfront.net/summit360web/assets'
          to: "cloudfront.net/#{gitSha}/assets"
#          to: "cloudfront.net/#{gitSha}/assets"
        ]

    s3:
      options:
        key: '<%= env.AWS.AccessKeyId %>'
        secret: '<%= env.AWS.SecretKey %>'
        bucket: '<%= env.AWS.bucket %>'
        region: '<%= env.AWS.region %>'
        access: 'public-read'
        headers:
          "Cache-Control": "max-age=630720000, public" # 2 years
          "Expires": new Date(Date.now() + 630720000).toUTCString()
      prod:
        upload: [
          src: 'dist/assets/**/*'
          dest: "summit360web/assets/"
          options: { verify: true }
        ]

    redis:
      options:
        manifestKey: 'releases'
        manifestSize: 10
        host: '<%= env.REDIS.production.host %>'
        port: '<%= env.REDIS.production.port %>'
        connectionOptions: auth_pass: '<%= env.REDIS.production.password %>'


      canary:
        options:
          prefix: "#{gitSha}:"
          currentDeployKey: "#{gitSha}"
        files:
          src: ["dist/index.html"]

      release:
        options:
          prefix: 'release:'
        files:
          src: ["dist/index.html"]



    shell:
      options:
        stdout: true
        stderr: true
        failOnError: true
      #dev: command: 'ember build --environment=development'
      prod: command: 'ember build --environment=production'
      done: command: "echo Deploy Complete, version key:" + gitSha


  #Load tasks from plugins
  grunt.loadNpmTasks 'grunt-s3'
  grunt.loadNpmTasks 'grunt-redis-manifest'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-gitinfo'
  grunt.loadNpmTasks 'grunt-text-replace'


  #Detirmine which version of task to run, default to dev
  # target = if grunt.option('prod') then 'prod' else 'dev'
  grunt.registerTask 'release', ['redis:release',"shell:done"]
  grunt.registerTask 'canary', ['redis:canary',"shell:done"]

  #This task performs the default build and release.
  grunt.registerTask 'publish', ['default', 'release']

  #By DEFAULT, Grunt will do a canary release.
  #Get the Git info x
  #Build x
  #Replace -? Replace will cache bust and same build stamps!
  #Upload to S3 x
  #Push to Redis x
  #Tidy up. TODO
  grunt.registerTask 'default', ["gitinfo", "shell:prod", "s3:prod", "canary"]