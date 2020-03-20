
import panel as pn
from aiida import load_profile
from aiida.orm import load_node

# connect to AiiDA DB
load_profile()

# load something from the DB
calc = load_node('3058bd6c-de0b-400e-aff5-2331a5f5d566')
out_dict = calc.outputs.output_parameters.get_dict()

# create panels to show results on website
out_dict_view = pn.Column(pn.pane.Markdown("## contents of output dict:"), out_dict)

# create website
page = pn.Column()
page.append(pn.pane.Markdown("# Test page"))
page.append(out_dict_view)
page.servable()
