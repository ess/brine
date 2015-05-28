desc 'Pull features from Github'
long_desc <<PUSHDESC
Push features to Github

If given a feature file, that feature will be pushed to Github.

If given no arguments, all features are pushed as issues.

In either of the above scenarios, if an equivalent issue already
exists, it will be updated. Otherwise, a new issue will be
created.
PUSHDESC

arg_name 'feature', :optional
command :push do |c|
  c.action do |global_options, options, args|
    puts "woohoo I pushed a fucking feature"
  end
end
