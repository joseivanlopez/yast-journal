require "yast"

require "systemd_journal/entries_dialog"
require "systemd_journal/query"

params = Yast::WFM.Args
raise "missing param for log entries" if params.empty?

query = SystemdJournal::Query.new(interval: "0", filters: { "unit" => params })
SystemdJournal::EntriesDialog.new(query: query).run
