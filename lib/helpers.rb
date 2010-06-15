# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

# Utilisation des helper
#
# ecrire 
# <% content_for :summary do %>
#    Sommaire que je veux ecrire
# <% end %>
#
# Pour remplir à la fois le texte et le sommaire

include Nanoc3::Helpers::Capturing
include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Text
include Nanoc3::Helpers::XMLSitemap
