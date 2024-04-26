global using AutoMapper;
global using Microsoft.AspNetCore.Mvc;
global using StudentSystemAPI.DataConnections;
global using StudentSystemAPI.Dto.OperationEntity.CollageDepartmentOperation;
global using StudentSystemAPI.Dto.OperationEntity.CollageOperation;
global using StudentSystemAPI.Dto.OperationEntity.JobOperation;
global using StudentSystemAPI.Dto.OperationEntity.PersonOperation;
global using StudentSystemAPI.Dto.OperationEntity.ProgramOperation;
global using StudentSystemAPI.Dto.OperationEntity.ProgramStudyOperation;
global using StudentSystemAPI.Dto.OperationEntity.StudentAdmissionsOperation;
global using StudentSystemAPI.Dto.OperationEntity.StudentOperation;
global using StudentSystemAPI.Dto.OperationEntity.StudentSurveyOperation;
global using StudentSystemAPI.Dto.OperationEntity.SyllabusOperation;
global using StudentSystemAPI.Dto.OperationEntity.TeacherOperation;
global using StudentSystemAPI.Dto.OperationEntity.TeachingOperation;
global using StudentSystemAPI.Dto.OperationEntity.UniversityOperation;
global using StudentSystemAPI.Dto.OperationEntity.UserOperation;
global using StudentSystemAPI.Exections;
global using StudentSystemAPI.Models.Entity;
global using StudentSystemAPI.Services.Interfaces;

// build the host application
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
//service configuration apps
builder.Services.ConfigureUniversity();
builder.Services.ConfigureCollege();
builder.Services.ConfigureDataConnections();
builder.Services.ConfigureJob();
builder.Services.ConfigureTeacher();
builder.Services.ConfigureSyllabus();
builder.Services.ConfigureTeaching();
builder.Services.ConfigureStudent();
builder.Services.ConfigureUniversity();
builder.Services.ConfigureCollegeDepartmentService();
builder.Services.ConfigureProgramService();
builder.Services.ConfigureProgramStudyService();
builder.Services.ConfigurePersonService();
builder.Services.ConfigureStudentService();
builder.Services.ConfigureTreatiseService();




builder.Services.AddAutoMapper(typeof(Program).Assembly);


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
	app.UseSwagger();
	app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();