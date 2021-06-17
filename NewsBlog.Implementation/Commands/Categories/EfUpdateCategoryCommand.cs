using AutoMapper;
using NewsBlog.Application.Commands.Categories;
using NewsBlog.Application.Commands.Posts;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.UploadFile;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Validators.Categories;
using NewsBlog.Implementation.Validators.Posts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Categories
{
    public class EfUpdateCategoryCommand : EfGenericUpdate<CategoryDto, Domain.Category>, IUpdateCategoryCommand
    {
        public EfUpdateCategoryCommand(NewsBlogContext context, IMapper mapper, UpdateCategoryValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => throw new NotImplementedException();

        public override string Name => throw new NotImplementedException();

    }
}
