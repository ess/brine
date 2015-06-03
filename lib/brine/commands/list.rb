desc 'List Github issues'
long_desc <<LISTDESC
List Github issues

This lists the open issues that live in Github and have at least one of the
following labels: enhancement, feature, story, use case, user story
LISTDESC

command :list do |c|
  c.desc 'Show pretty list'
  c.switch [:p, :pretty]
  c.action do |global_options, options, args|
    list = Brine.list

    if options[:pretty]
      require 'terminal-table'
      issues = Terminal::Table.new(
        headings: ['Number', 'Title'],
        rows: list
      )

      issues.align_column(0, :right)
      puts issues
    else
      puts list.map {|item| "#{item.first}|#{item.last}"}.join("\n")
    end
  end
end
