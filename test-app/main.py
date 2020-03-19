
import panel as pn
from aiida import load_profile

load_profile()

page = pn.Column()
page.append(pn.pane.Markdown("# Test page"))
page.servable()
