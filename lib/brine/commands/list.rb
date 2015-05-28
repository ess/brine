desc 'List Github issues'
long_desc <<LISTDESC
List Github issues

This lists the open issues that live in Github and have at least one of the
following labels: enhancement, feature, story, use case, user story
LISTDESC

command :list do |c|
  c.action do |global_options, options, args|
    puts "woohoo I listed the fucking issues"
  end
end
