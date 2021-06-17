using AutoMapper;
using NewsBlog.Application.Commands.Categories;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Categories
{
    public class EfDeleteCategoryCommand : EfGenericDelete<Domain.Category>, IDeleteCategoryCommand
    {
        public EfDeleteCategoryCommand(NewsBlogContext context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteCategoryCommand;

        public override string Name => "Delete category";
    }
}
