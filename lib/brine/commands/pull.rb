desc 'Pull features from Github'
long_desc <<PULLDESC
Pull features from Github

If given an issue number, that issue will be written to a feature.

If given a feature file, that feature will be updated from Github.

If given no arguments, all issues are pulled as features.
PULLDESC
arg_name 'issue or feature', :optional
command :pull do |c|
  c.action do |global_options, options, args|
    puts "woohoo I pulled a fucking feature"
  end
end
