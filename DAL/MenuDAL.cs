using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class MenuDAL : BaseDAL<Menu>
    {
        /// <summary>
        /// 获取菜单树
        /// </summary>
        /// <param name="userId">用户ID</param>
        /// <returns></returns>
        public List<MenuTree> getMenuTree(int userId)
        {
            List<MenuTree> menuTree = new List<MenuTree>();

            var menus = new MenuDAL().Get();
            var authoritys = new UserAuthorityDAL().Get().Where(o => o.UserId == userId).OrderBy(o => o.MenuId).ToList().Distinct();
            var firstMenu = menus.Where(o => o.MenuPid == "0").ToList();
            for (int i = 0; i < firstMenu.Count(); i++)
            {
                string menuid = firstMenu[i].MenuId;
                if (authoritys.Where(o => o.MenuId == menuid).Count() > 0)
                {
                    MenuTree first = new MenuTree();
                    List<MenuTree> childs = new List<MenuTree>();
                    first.name = firstMenu[i].MenuName;
                    first.url = firstMenu[i].MenuUrl;
                    first._class = firstMenu[i].Class;
                    first.childs = childs;
                    first.showChild = i == 0;

                    foreach (Menu item in menus.Where(o => o.MenuPid == menuid))
                    {
                        if (authoritys.Where(o => o.MenuId == item.MenuId).Count() > 0)
                        {
                            MenuTree second = new MenuTree();
                            second.name = item.MenuName;
                            second.url = item.MenuUrl;
                            second._class = item.Class;
                            childs.Add(second);
                        }
                    }
                    menuTree.Add(first);
                }
            }

            return menuTree;
        }
    }
}
