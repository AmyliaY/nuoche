package weixin.popular.bean;

import java.util.List;

public class Menu extends BaseResult{
	
	private MenuButtons menu;
	
	@Override
	public String toString() {
		if (menu==null)
			return "";
		
		MenuButtons.Button[] buttons =  menu.getButton();
		StringBuffer sb = new StringBuffer("");
		if (buttons!=null)
		{
			for (MenuButtons.Button b : buttons) {
				sb.append(b.getKey()).append(b.getName()).append(b.getType()).append(b.getUrl());
				List<MenuButtons.Button> subList =  b.getSub_button();
				if (subList!=null)
				{
					for (MenuButtons.Button bb : subList) {
						sb.append(bb.getKey()).append(bb.getName()).append(bb.getType()).append(bb.getUrl());
						
					}
				}
			}
		}
		return sb.toString();
	}

	public MenuButtons getMenu() {
		return menu;
	}

	public void setMenu(MenuButtons menu) {
		this.menu = menu;
	}
	
	
}
