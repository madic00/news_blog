using FluentValidation;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using NewsBlog.BusinessLayer;
using NewsBlog.Implementation.Commands;

namespace Zadatak2.UserInterface.Core
{
    public static class DIExtensions
    {
        public static void AddCommandsAndQueries(this IServiceCollection services, string implementationPrefix = "Ef")
        {
            var interfaces = typeof(ICommand<>).Assembly.GetTypes()
                .Where(type =>
                    type.IsInterface &&
                    type.GetInterfaces()
                    .Any(@interface =>
                        @interface.Name == typeof(ICommand<>).Name ||
                        @interface.Name == typeof(IQuery<,>).Name
                    )
                )
                .ToList();
            var implementations = typeof(EfGenericDelete<>).Assembly.GetTypes()
                .Where(type =>
                    !type.IsAbstract &&
                    type.GetInterfaces()
                    .Any(@interface =>
                        @interface.GetInterfaces()
                        .Any(i =>
                            i.Name == typeof(ICommand<>).Name ||
                            i.Name == typeof(IQuery<,>).Name
                        )
                    )
                )
                .ToList();
            foreach (var @interface in interfaces)
            {
                Console.WriteLine(@interface.FullName);
                var implementation = implementations.FirstOrDefault(type =>
                        type.GetInterface(@interface.Name) != null &&
                        type.Name.StartsWith(implementationPrefix)
                    );
                if (implementation != null)
                {
                    Console.WriteLine("ima implementaciju");
                    Console.WriteLine(implementation.FullName);
                    services.AddTransient(@interface, implementation);
                }
                else
                {
                    Console.WriteLine("nema implementaciju");
                }
                Console.WriteLine();
            }
        }

        public static void AddValidators(this IServiceCollection services)
        {
            var validators = typeof(EfGenericDelete<>).Assembly.GetTypes()
               .Where(type =>
                   !type.IsAbstract &&
                   type.BaseType.Name == typeof(AbstractValidator<>).Name
               )
               .ToList();
            foreach (var validator in validators)
            {
                Console.WriteLine(validator.FullName);
                var dto = validator.BaseType.GetGenericArguments().FirstOrDefault();
                Console.WriteLine(dto.FullName);
                var abstractValidatorForSpecificDto = typeof(AbstractValidator<>).MakeGenericType(dto);
                services.AddTransient(validator);
                services.AddTransient(abstractValidatorForSpecificDto, validator);
                Console.WriteLine();
            }
        }
    }
}
