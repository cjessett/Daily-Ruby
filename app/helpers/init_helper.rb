helpers do

  def docs_url(classname, method_link = '')
    "http://www.ruby-doc.org/core-2.0.0/#{classname}.html" + "#{method_link}"
  end

  def random_class
    ['Array', 'Enumerable', 'Hash', 'Numeric', 'Object', 'Range', 'Regexp', 'String', 'Time'].sample
  end

  def random_method(classname)
    # doc(classname) -->
    doc = Nokogiri::HTML(open(self.docs_url(classname)))

    # method(doc) -->
    method_list = doc.css('.link-list').first.children.css('li')
    list_length = method_list.count
    method = method_list[rand(list_length + 1)]

    # method_name(method) -->
    method_name = method.text

    # method_link(method) -->
    method_link = method.children[0].values[0]

    # method_div() -->
    node = doc.xpath(find_by_xpath(method_link))
    method_div = node[0].parent
    method_div.css('.method-source-code, .method-click-advice').remove # remove the source code toggle
    [classname, method_name, method_link, method_div]
  end

  def find_by_xpath(method_link)
    "//a[@name='#{method_link[1..-1]}']"
  end

end
