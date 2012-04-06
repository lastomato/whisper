atom_feed do |feed|
  feed.title("Tomato's")
  feed.updated(@entries.desc(:created_at).first.created_at) if @entries.length > 0

  @entries.each do |entry|
    feed.entry(entry, :url => entry_show_path(entry.permalink)) do |e|
      e.title(entry.title)
      e.content(markdown(entry.body), :type => 'html')

      e.author do |author|
        author.name(entry.user.username)
      end
    end
  end
end