using AutoMapper;
using FluentValidation;
using NewsBlog.Application.Commands.Categories;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Validators.Categories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Categories
{
    public class EfCreateCategoryCommand : EfGenericInsert<CategoryDto, Domain.Category>, ICreateCategoryCommand
    {

        public EfCreateCategoryCommand(NewsBlogContext context, IMapper mapper, UpdateCategoryValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfCreateCategoryCommand;

        public override string Name => "Create Category";

        //public void Execute(CategoryDto request)
        //{
        //    _validator.ValidateAndThrow(request);

        //    var category = _mapper.Map<Domain.Category>(request);

        //    _context.Categories.Add(category);
        //    _context.SaveChanges();

        //}


    }
}
