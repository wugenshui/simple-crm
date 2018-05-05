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
            var firstMenu = menus.Where(o => o.MenuPid == "0");
            foreach (Menu menu in firstMenu)
            {
                if (authoritys.Where(o => o.MenuId == menu.MenuId).Count() > 0)
                {
                    MenuTree first = new MenuTree();
                    List<MenuTree> childs = new List<MenuTree>();
                    first.MenuName = menu.MenuName;
                    first.MenuURL = menu.MenuUrl;
                    first.Class = menu.Class;
                    first.Childs = childs;

                    foreach (Menu item in menus.Where(o => o.MenuPid == menu.MenuId))
                    {
                        if (authoritys.Where(o => o.MenuId == item.MenuId).Count() > 0)
                        {
                            MenuTree second = new MenuTree();
                            second.MenuName = item.MenuName;
                            second.MenuURL = item.MenuUrl;
                            second.Class = item.Class;
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
