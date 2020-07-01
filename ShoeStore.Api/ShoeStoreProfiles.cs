using ShoeStore.Application.DataTransfer;
using ShoeStore.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoeStore.Api
{
    public class ShoeStoreProfiles : Profile
    {   public ShoeStoreProfiles()
        {
            CreateMap<User, UserDto>().ReverseMap();
            CreateMap<User, UserAddDto>().ReverseMap();
            CreateMap<User, EditUserDto>().ReverseMap();
            CreateMap<RegisterUserDto, User>().ReverseMap();
            CreateMap<Role, RoleDto>().ReverseMap();
            CreateMap<Brand, BrandDto>().ReverseMap();
            CreateMap<Gender, GenderDto>().ReverseMap();
            CreateMap<ShoeType, ShoeTypeDto>().ReverseMap();
            CreateMap<UseCaseLog, UseCaseLogDto>().ReverseMap();
            CreateMap<Product, ProductDto>()
                .ForMember(dest => dest.BrandName,
               opts => opts.MapFrom(src => src.Brand != null ? src.Brand.Name : ""))
                .ForMember(dest => dest.GenderName,
               opts => opts.MapFrom(src => src.Gender != null ? src.Gender.Name : ""))
                .ForMember(dest => dest.ShoeTypeName,
               opts => opts.MapFrom(src => src.ShoeType != null ? src.ShoeType.Name : ""));
            CreateMap<ProductChangeDto, Product>();

            CreateMap<Order, OrderGetDto>()
           .ForMember(dto => dto.UserInfo, opt => opt.MapFrom(order => order.User.FirstName + " " + order.User.LastName + " " + order.User.Username))
           .ForMember(dto => dto.Status, opt => opt.MapFrom(order => order.OrderStatus.ToString()))
           .ForMember(dto => dto.OrderLines, opt => opt.MapFrom(order => order.OrderLines.Select(ol => new OrderLineGetDto
           {
               Id = ol.Id,
               Name = ol.Name,
               Price = ol.Price,
               Quantity = ol.Quantity
           })));

        }
    }
}
