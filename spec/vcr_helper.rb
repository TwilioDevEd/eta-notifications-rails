VCR.configure do |configure|
  configure.cassette_library_dir = "spec/fixtures/cassettes"
  configure.hook_into :webmock
  configure.ignore_localhost = true
  configure.register_request_matcher :uri do |request1, request2|
    request1.uri.match(request2.uri)
  end
end
