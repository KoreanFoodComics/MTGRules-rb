class IphoneSubSubSectionMenuController < UITableViewController

  attr_accessor :delegate, :contents


  def viewDidLoad
    view.dataSource = view.delegate = self
    self.title = contents.text
  end


  def numberOfSectionsInTableView(tableView)
    1
  end


  def tableView(tableView, numberOfRowsInSection: section)
    contents.size
  end


  def tableView(tableView, cellForRowAtIndexPath: index_path)
    cell = tableView.dequeueReusableCellWithIdentifier("cell")
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: "cell")
    end

    child = contents[index_path.row]
    cell.accessoryType = UITableViewCellAccessoryNone
    cell.textLabel.text = child.text
    cell
  end


  def show_rules_for(entry)
    rules = delegate.database.get_rules_for_subsection(entry.subsection, and_subsubsection: entry.subsubsection)
    rule_view_controller = IphoneRuleViewController.alloc.initWithNibName("IphoneRuleView", bundle: nil)
    rule_view_controller.rules = rules
    rule_view_controller.delegate = delegate
    rule_view_controller.title = entry.text
    navigationController().pushViewController(rule_view_controller, animated: true)
  end


  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    child = contents[index_path.row]
    show_rules_for(child)
  end


end
