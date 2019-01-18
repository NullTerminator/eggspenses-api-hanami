guard 'rspec', spec_paths: ["spec"], cmd: "bundle exec rspec --color --format documentation --require spec_helper", all_after_pass: false, all_on_start: true do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^apps/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
end
