USE [master]
GO
/****** Object:  Database [StudentSystem]    Script Date: 2/5/2024 6:02:52 PM ******/
CREATE DATABASE [StudentSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NEWSQL\MSSQL\DATA\StudentSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NEWSQL\MSSQL\DATA\StudentSystem_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentSystem] SET  MULTI_USER 
GO
ALTER DATABASE [StudentSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentSystem', N'ON'
GO
ALTER DATABASE [StudentSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudentSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudentSystem]
GO
/****** Object:  Table [dbo].[TB_CollegeDepartment]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CollegeDepartment](
	[CollegeDepartmentId] [int] NOT NULL,
	[CollegeDepartmentName] [nvarchar](255) NULL,
	[CollegeId] [int] NOT NULL,
 CONSTRAINT [PK__TB_Colle__6ED8BA487BC1D973] PRIMARY KEY CLUSTERED 
(
	[CollegeDepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Colleges]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Colleges](
	[CollegeId] [int] NOT NULL,
	[CollegeName] [nvarchar](255) NOT NULL,
	[UniversityId] [int] NOT NULL,
 CONSTRAINT [PK__TB_Colla__56F6D79B462F9925] PRIMARY KEY CLUSTERED 
(
	[CollegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_JobStudentInfo]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_JobStudentInfo](
	[JobId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[JobLocation] [nvarchar](255) NOT NULL,
	[JobType] [nvarchar](255) NOT NULL,
	[DateOfCommencementAfterTheLastCertificate] [date] NULL,
	[NoObjectionLetterNumber] [int] NULL,
	[DateOfTheNoObjectionBook] [date] NULL,
	[TypeOfStudyLeave] [nvarchar](255) NULL,
 CONSTRAINT [PK__TB_JobSt__056690C239CF005D] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PersonalInfo]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PersonalInfo](
	[PersonId] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[SecondName] [varchar](255) NOT NULL,
	[ThirdName] [varchar](255) NOT NULL,
	[ForthName] [varchar](255) NOT NULL,
	[TitleName] [varchar](255) NULL,
	[MotherName] [varchar](255) NULL,
	[SexType] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Email] [varchar](255) NULL,
	[PhoneNumber] [varchar](255) NOT NULL,
	[HomeAddress] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Program]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Program](
	[ProgramId] [int] NOT NULL,
	[ProgramName] [nvarchar](255) NULL,
 CONSTRAINT [PK__TB_Progr__752560588636CCC0] PRIMARY KEY CLUSTERED 
(
	[ProgramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ProgramStudy]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ProgramStudy](
	[ProgramStudyId] [int] NOT NULL,
	[ProgramId] [int] NOT NULL,
	[CollegeDepartmentId] [int] NOT NULL,
 CONSTRAINT [PK__TB_Progr__AC266382B9E74026] PRIMARY KEY CLUSTERED 
(
	[ProgramStudyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Student]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Student](
	[StudentId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[ChannelId] [int] NOT NULL,
	[RegistrationPromotion] [nvarchar](255) NOT NULL,
	[DateStudy] [date] NULL,
	[ProgramStudyId] [int] NOT NULL,
 CONSTRAINT [PK__TB_Stude__32C52B9970F296B1] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_StudentAdmissions]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_StudentAdmissions](
	[ChannelId] [int] NOT NULL,
	[AcceptanceChannel] [nvarchar](255) NOT NULL,
	[YearOfAdmission] [nvarchar](255) NOT NULL,
	[AdmissionMeal] [nvarchar](255) NOT NULL,
	[UniversityAdmissionOrderNumber] [nvarchar](255) NOT NULL,
	[DateOfUniversityAdmissionOrder] [nvarchar](255) NULL,
	[AdministrativeOrderNumberForAcceptance] [nvarchar](255) NULL,
	[DateAdministrativeOrderOfAcceptance] [nvarchar](255) NULL,
 CONSTRAINT [PK__TB_Stude__38C3E814C1D6E3B3] PRIMARY KEY CLUSTERED 
(
	[ChannelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_StudentSurvey]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_StudentSurvey](
	[SurveyId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[GrantingTheCertificate] [nvarchar](255) NOT NULL,
	[StudentTotal] [real] NOT NULL,
	[GraduationYear] [nvarchar](255) NOT NULL,
	[CertificateDate] [date] NOT NULL,
	[DocumentNumber] [int] NOT NULL,
	[DocumentDate] [date] NOT NULL,
 CONSTRAINT [PK__TB_Stude__A5481F7D00E25D0C] PRIMARY KEY CLUSTERED 
(
	[SurveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Syllabus]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Syllabus](
	[SyllabusId] [int] NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[SubjectArb] [nvarchar](255) NULL,
	[Units] [int] NULL,
	[TotalHours] [int] NULL,
	[Semester] [int] NOT NULL,
 CONSTRAINT [PK__TB_Sylla__9B8016A69AE644DA] PRIMARY KEY CLUSTERED 
(
	[SyllabusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Teacher]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Teacher](
	[TeacherId] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[SecondName] [varchar](255) NOT NULL,
	[ThirdName] [varchar](255) NOT NULL,
	[ForthName] [varchar](255) NULL,
	[Email] [varchar](255) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[PhoneNumber] [varchar](255) NOT NULL,
	[SexType] [int] NOT NULL,
	[HighDiploma] [int] NOT NULL,
	[MasterStudent] [int] NOT NULL,
	[PhDStudent] [int] NOT NULL,
	[StudyTypeName] [varchar](255) NOT NULL,
	[ScientificTitle] [varchar](255) NOT NULL,
	[StudyGeneralName] [varchar](255) NOT NULL,
	[StudyCompetenceName] [varchar](255) NOT NULL,
	[NBookCurrent] [varchar](255) NOT NULL,
	[DateBookCurrent] [varchar](255) NOT NULL,
 CONSTRAINT [PK__TB_Teach__EDF2596447EF698E] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Teaching]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Teaching](
	[TeachId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[SyllabusId] [int] NOT NULL,
 CONSTRAINT [PK_TB_Teaching] PRIMARY KEY CLUSTERED 
(
	[TeachId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Treatise]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Treatise](
	[TreatiseId] [int] NOT NULL,
	[ThesisTitle] [nvarchar](1000) NOT NULL,
	[DateOfCommencementOfSupervision] [date] NOT NULL,
	[SupervisorAssignmentOrderNumber] [varchar](255) NOT NULL,
	[TheDateOfTheOrderAppointingSupervisor] [date] NOT NULL,
	[NameAndTitleOfTheSupervisor] [nvarchar](255) NOT NULL,
	[SupervisorSpecialty] [nvarchar](255) NOT NULL,
	[MessageDelivery] [bit] NOT NULL,
	[DiscussionCommitteeOrderNumber] [nvarchar](255) NOT NULL,
	[DateOfTheDiscussionCommitteeOrder] [date] NOT NULL,
	[CourseRate] [real] NOT NULL,
	[DegreeOfDiscussion] [real] NOT NULL,
	[FinalGraduationRate] [real] NOT NULL,
	[UniversityOrderNumberGrantingTheCertificate] [nvarchar](255) NOT NULL,
	[DateOfTheUniversityOrderGrantingTheCertificate] [date] NOT NULL,
	[AdministrativeOrderNumberForTheFirstExtension] [nvarchar](255) NULL,
	[DateOfTheAdministrativeOrderForTheFirstExtension] [date] NULL,
	[AdministrativeOrderNumberForTheSecondExtension] [nvarchar](255) NULL,
	[DateOfTheAdministrativeOrderForTheSecondExtension] [date] NULL,
	[Notes] [nvarchar](4000) NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK__TB_Treat__261BB5E8C1E25296] PRIMARY KEY CLUSTERED 
(
	[TreatiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_University]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_University](
	[UniversityId] [int] NOT NULL,
	[UniversityName] [nvarchar](255) NULL,
 CONSTRAINT [PK__TB_Unive__9F19E1BC9C35811F] PRIMARY KEY CLUSTERED 
(
	[UniversityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Users]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Users](
	[UserId] [int] NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
 CONSTRAINT [PK__TB_User__1788CC4CE86BDEA4] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TB_CollegeDepartment]  WITH CHECK ADD  CONSTRAINT [FK_TB_CollegeDepartment_Collages] FOREIGN KEY([CollegeId])
REFERENCES [dbo].[TB_Colleges] ([CollegeId])
GO
ALTER TABLE [dbo].[TB_CollegeDepartment] CHECK CONSTRAINT [FK_TB_CollegeDepartment_Collages]
GO
ALTER TABLE [dbo].[TB_Colleges]  WITH CHECK ADD  CONSTRAINT [FK_TB_Collages_University] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[TB_University] ([UniversityId])
GO
ALTER TABLE [dbo].[TB_Colleges] CHECK CONSTRAINT [FK_TB_Collages_University]
GO
ALTER TABLE [dbo].[TB_JobStudentInfo]  WITH CHECK ADD  CONSTRAINT [FK_TB_JobStudentInfo_PersonalInfo] FOREIGN KEY([PersonId])
REFERENCES [dbo].[TB_PersonalInfo] ([PersonId])
GO
ALTER TABLE [dbo].[TB_JobStudentInfo] CHECK CONSTRAINT [FK_TB_JobStudentInfo_PersonalInfo]
GO
ALTER TABLE [dbo].[TB_ProgramStudy]  WITH CHECK ADD  CONSTRAINT [FK_TB_ProgramStudy_CollegeDepartment] FOREIGN KEY([CollegeDepartmentId])
REFERENCES [dbo].[TB_CollegeDepartment] ([CollegeDepartmentId])
GO
ALTER TABLE [dbo].[TB_ProgramStudy] CHECK CONSTRAINT [FK_TB_ProgramStudy_CollegeDepartment]
GO
ALTER TABLE [dbo].[TB_ProgramStudy]  WITH CHECK ADD  CONSTRAINT [FK_TB_ProgramStudy_Program] FOREIGN KEY([ProgramId])
REFERENCES [dbo].[TB_Program] ([ProgramId])
GO
ALTER TABLE [dbo].[TB_ProgramStudy] CHECK CONSTRAINT [FK_TB_ProgramStudy_Program]
GO
ALTER TABLE [dbo].[TB_Student]  WITH CHECK ADD  CONSTRAINT [FK_TB_Student_ProgramStudy] FOREIGN KEY([ProgramStudyId])
REFERENCES [dbo].[TB_ProgramStudy] ([ProgramStudyId])
GO
ALTER TABLE [dbo].[TB_Student] CHECK CONSTRAINT [FK_TB_Student_ProgramStudy]
GO
ALTER TABLE [dbo].[TB_Student]  WITH CHECK ADD  CONSTRAINT [FK_TB_Student_StudentAdmissions] FOREIGN KEY([ChannelId])
REFERENCES [dbo].[TB_StudentAdmissions] ([ChannelId])
GO
ALTER TABLE [dbo].[TB_Student] CHECK CONSTRAINT [FK_TB_Student_StudentAdmissions]
GO
ALTER TABLE [dbo].[TB_Student]  WITH CHECK ADD  CONSTRAINT [FK_TB_Student_TB_PersonalInfo] FOREIGN KEY([PersonId])
REFERENCES [dbo].[TB_PersonalInfo] ([PersonId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TB_Student] CHECK CONSTRAINT [FK_TB_Student_TB_PersonalInfo]
GO
ALTER TABLE [dbo].[TB_StudentSurvey]  WITH CHECK ADD  CONSTRAINT [FK_TB_StudentSurvey_PersonalInfo] FOREIGN KEY([PersonId])
REFERENCES [dbo].[TB_PersonalInfo] ([PersonId])
GO
ALTER TABLE [dbo].[TB_StudentSurvey] CHECK CONSTRAINT [FK_TB_StudentSurvey_PersonalInfo]
GO
ALTER TABLE [dbo].[TB_Teaching]  WITH CHECK ADD  CONSTRAINT [FK_TB_Teaching_TB_Syllabus] FOREIGN KEY([SyllabusId])
REFERENCES [dbo].[TB_Syllabus] ([SyllabusId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TB_Teaching] CHECK CONSTRAINT [FK_TB_Teaching_TB_Syllabus]
GO
ALTER TABLE [dbo].[TB_Teaching]  WITH CHECK ADD  CONSTRAINT [FK_TB_Teaching_TB_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[TB_Teacher] ([TeacherId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TB_Teaching] CHECK CONSTRAINT [FK_TB_Teaching_TB_Teacher]
GO
ALTER TABLE [dbo].[TB_Treatise]  WITH CHECK ADD  CONSTRAINT [FK_TB_Treatise_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[TB_Student] ([StudentId])
GO
ALTER TABLE [dbo].[TB_Treatise] CHECK CONSTRAINT [FK_TB_Treatise_Student]
GO
/****** Object:  StoredProcedure [dbo].[TB_College_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TB_College_Delete] @CollegeId INT = 0
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    IF EXISTS (SELECT
          1
        FROM [dbo].[TB_Colleges]
        WHERE CollegeId = @CollegeId)
      AND NOT EXISTS (SELECT
          1
        FROM TB_CollegeDepartment
        WHERE CollegeId = @CollegeId)
    BEGIN
      DELETE FROM [dbo].[TB_Colleges]
      WHERE CollegeId = @CollegeId;
      SET @returnflag = 1;
    END
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END;
GO
/****** Object:  StoredProcedure [dbo].[TB_College_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[TB_College_GetAll] @CollegeId INT NULL = 0
AS

BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    SELECT
      *
    FROM TB_Colleges;
    SET @returnflag = 2;

  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END;
GO
/****** Object:  StoredProcedure [dbo].[TB_College_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[TB_College_GetById] @CollegeId INT NULL = 0
AS

BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    SELECT
      *
    FROM TB_Colleges
    WHERE CollegeId = @CollegeId;
    SET @returnflag = 1;
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;

  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_College_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_College_Save] @CollegeId INT = 0,
@CollegeName NVARCHAR(255),
@UniversityId INT
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		-- check if is in table or not
		IF EXISTS (SELECT
					1
				FROM [dbo].[TB_University]
				WHERE [UniversityId] = @UniversityId)

		BEGIN
			IF EXISTS (SELECT
						1
					FROM [dbo].[TB_Colleges]
					WHERE [CollegeId] = @CollegeId)
			BEGIN
				-- update data
				UPDATE [TB_Colleges]
				SET CollegeName = @CollegeName
				   ,UniversityId = @UniversityId
				WHERE CollegeId = @CollegeId;

				SET @returnflag = 2;
			END;
			ELSE
			BEGIN
				-- insert data 
				SELECT
					@CollegeId = ISNULL(MAX(CollegeId), 0) + 1
				FROM TB_Colleges;

				INSERT INTO [dbo].[TB_Colleges] ([CollegeId], [CollegeName], [UniversityId])
					VALUES (@CollegeId, @CollegeName, @UniversityId);

				SET @returnflag = 1;
			END;
		END

	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END;
GO
/****** Object:  StoredProcedure [dbo].[TB_CollegeDepartment_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[TB_CollegeDepartment_Delete] @CollegeDepartmentId INT NULL = 0
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    IF EXISTS (SELECT
          1
        FROM dbo.TB_CollegeDepartment tcd
        WHERE tcd.CollegeDepartmentId = @CollegeDepartmentId)
      AND NOT EXISTS (SELECT
          1
        FROM TB_ProgramStudy tps
        WHERE tps.CollegeDepartmentId = @CollegeDepartmentId)
    BEGIN
      DELETE FROM dbo.TB_CollegeDepartment
      WHERE CollegeDepartmentId = @CollegeDepartmentId;
      SET @returnflag = 1;

    END
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_CollegeDepartment_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[TB_CollegeDepartment_GetAll]
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    SELECT
      *
    FROM TB_CollegeDepartment tcd;
    SET @returnflag = 1;
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_CollegeDepartment_GetByid]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[TB_CollegeDepartment_GetByid] @CollegeDepartmentId INT NULL = 0
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    IF EXISTS (SELECT
          1
        FROM dbo.TB_CollegeDepartment tcd
        WHERE tcd.CollegeDepartmentId = @CollegeDepartmentId)
    BEGIN
      SELECT
        *
      FROM TB_CollegeDepartment tcd
      WHERE tcd.CollegeDepartmentId = @CollegeDepartmentId
      SET @returnflag = 1;

    END
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_CollegeDepartment_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_CollegeDepartment_Save] @CollegeDepartmentId INT NULL = 0,
@CollegeDepartmentName NVARCHAR(255) NULL,
@CollegeId INT
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Colleges tc
				WHERE tc.CollegeId = @CollegeId)
		BEGIN
			IF EXISTS (SELECT
						1
					FROM TB_CollegeDepartment tcd
					WHERE tcd.CollegeDepartmentId = @CollegeDepartmentId)

			BEGIN
				UPDATE TB_CollegeDepartment
				SET CollegeDepartmentName = @CollegeDepartmentName
				   ,CollegeId = @CollegeId
				WHERE CollegeDepartmentId = @CollegeDepartmentId;
				SET @returnflag = 2;
			END
			ELSE
			BEGIN
				SELECT
					@CollegeDepartmentId = ISNULL(MAX(CollegeDepartmentId), 0) + 1
				FROM TB_CollegeDepartment tcd;
				INSERT INTO TB_CollegeDepartment (CollegeDepartmentId, CollegeDepartmentName, CollegeId)
					VALUES (@CollegeDepartmentId, @CollegeDepartmentName, @CollegeId);
				SET @returnflag = 1;
			END
		END
	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag
END
GO
/****** Object:  StoredProcedure [dbo].[TB_JobStudentInfo_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_JobStudentInfo_Delete] @JobId INT NULL = 0

AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_JobStudentInfo tjsi
				WHERE tjsi.JobId = @JobId)
		BEGIN

			DELETE FROM TB_JobStudentInfo
			WHERE JobId = @JobId
			SET @returnflag = 1;
		END

	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;

END;
GO
/****** Object:  StoredProcedure [dbo].[TB_JobStudentInfo_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_JobStudentInfo_GetAll]
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		SELECT
			*
		FROM TB_JobStudentInfo;
		SET @returnflag = 1;
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;

END;
GO
/****** Object:  StoredProcedure [dbo].[TB_JobStudentInfo_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_JobStudentInfo_GetById] @JobId INT NULL = 0

AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_JobStudentInfo tjsi
				WHERE tjsi.JobId = @JobId)
		BEGIN

			SELECT* FROM TB_JobStudentInfo
			WHERE JobId = @JobId
			SET @returnflag = 1;
		END

	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;

END;
GO
/****** Object:  StoredProcedure [dbo].[TB_JobStudentInfo_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_JobStudentInfo_Save] @JobId INT NULL = 0,
@PersonId INT,
@JobLocation NVARCHAR(255),
@JobType NVARCHAR(255),
@DateOfCommencementAfterTheLastCertificate DATETIME,
@NoObjectionLetterNumber INT,
@DateOfTheNoObjectionBook DATETIME,
@TypeOfStudyLeave NVARCHAR(255)

AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_PersonalInfo tpi
				WHERE tpi.PersonId = @PersonId)
		BEGIN

			IF EXISTS (SELECT
						1
					FROM dbo.TB_JobStudentInfo tjsi
					WHERE tjsi.JobId = @JobId)
			BEGIN

				UPDATE dbo.TB_JobStudentInfo
				SET PersonId = @PersonId
				   ,JobLocation = @JobLocation
				   ,JobType = @JobType
				   ,DateOfCommencementAfterTheLastCertificate = @DateOfCommencementAfterTheLastCertificate
				   ,NoObjectionLetterNumber = @NoObjectionLetterNumber
				   ,DateOfTheNoObjectionBook = @DateOfTheNoObjectionBook
				   ,TypeOfStudyLeave = @TypeOfStudyLeave
				WHERE JobId = @JobId
				SET @returnflag = 2;
			END
			ELSE
			BEGIN
				SELECT
					@JobId = ISNULL(MAX(tjsi.JobId), 0) + 1
				FROM TB_JobStudentInfo tjsi
				INSERT INTO dbo.TB_JobStudentInfo (JobId, PersonId, JobLocation, JobType, DateOfCommencementAfterTheLastCertificate,
				NoObjectionLetterNumber, DateOfTheNoObjectionBook, TypeOfStudyLeave)
					SELECT
						@JobId
					   ,@PersonId
					   ,@JobLocation
					   ,@JobType
					   ,@DateOfCommencementAfterTheLastCertificate
					   ,@NoObjectionLetterNumber
					   ,@DateOfTheNoObjectionBook
					   ,@TypeOfStudyLeave;
				SET @returnflag = 1;
			END
		END
	END TRY
	BEGIN CATCH
	SET @returnflag =-1;
	END CATCH
	RETURN @returnflag;

END;
GO
/****** Object:  StoredProcedure [dbo].[TB_PersonalInfo_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_PersonalInfo_Delete] @PersonId INT NULL = 0
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM TB_PersonalInfo tpi
				WHERE tpi.PersonId = @PersonId)
		BEGIN

			DELETE FROM dbo.TB_PersonalInfo
			WHERE PersonId = @PersonId;
			SET @returnflag = 1;
		END
	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH

	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_PersonalInfo_Get]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_PersonalInfo_Get]
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		SELECT
			*
		FROM TB_PersonalInfo;
		SET @returnflag = 1;
	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_PersonalInfo_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_PersonalInfo_GetById] @PersonId INT NULL = 0
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		SELECT
			*
		FROM TB_PersonalInfo tpi
		WHERE tpi.PersonId = @PersonId;
		SET @returnflag = 1;
	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_PersonalInfo_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_PersonalInfo_Save] @PersonId INT NULL = 0,
@FirstName VARCHAR(255),
@SecondName VARCHAR(255),
@ThirdName VARCHAR(255),
@ForthName VARCHAR(255) NULL,
@TitleName VARCHAR(255),
@MotherName VARCHAR(255),
@SexType INT,
@DateOfBirth DATE,
@Email VARCHAR(255),
@PhoneNumber VARCHAR(255),
@HomeAddress NVARCHAR(255)
AS
BEGIN
	DECLARE @retrunflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_PersonalInfo tpi
				WHERE tpi.PersonId = @PersonId)
		BEGIN
			UPDATE dbo.TB_PersonalInfo
			SET FirstName = @FirstName
			   ,SecondName = @SecondName
			   ,ThirdName = @ThirdName
			   ,ForthName = @ForthName
			   ,TitleName = @TitleName
			   ,MotherName = @MotherName
			   ,SexType = @SexType
			   ,DateOfBirth = @DateOfBirth
			   ,Email = @Email
			   ,PhoneNumber = @PhoneNumber
			   ,HomeAddress = @HomeAddress
			WHERE PersonId = @PersonId

			SET @retrunflag = 2;
		END
		ELSE
		BEGIN
			SELECT
				@PersonId = ISNULL(MAX(tpi.PersonId), 0) + 1
			FROM TB_PersonalInfo tpi;

			INSERT INTO dbo.TB_PersonalInfo (PersonId, FirstName, SecondName, ThirdName, ForthName, TitleName,
			MotherName, SexType, DateOfBirth, Email, PhoneNumber, HomeAddress)
				SELECT
					@PersonId
				   ,@FirstName
				   ,@SecondName
				   ,@ThirdName
				   ,@ForthName
				   ,@TitleName
				   ,@MotherName
				   ,@SexType
				   ,@DateOfBirth
				   ,@Email
				   ,@PhoneNumber
				   ,@HomeAddress
		END
		SET @retrunflag = 1;
	END TRY

	BEGIN CATCH
		SET @retrunflag = -1;
	END CATCH
	RETURN @retrunflag
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Program_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TB_Program_Delete] @ProgramId INT = 0
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    IF EXISTS (SELECT
          1
        FROM TB_Program tp
        WHERE tp.ProgramId = @ProgramId)
      AND NOT EXISTS (SELECT
          1
        FROM TB_ProgramStudy tps
        WHERE tps.ProgramId = @ProgramId)
    BEGIN
      DELETE FROM dbo.TB_Program
      WHERE ProgramId = @ProgramId;
      SET @returnflag = 1;
    END
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Program_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TB_Program_GetAll]
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    SELECT
      *
    FROM TB_Program tp;
    SET @returnflag = 1;
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Program_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_Program_GetById] @ProgramId INT = 0
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					*
				FROM TB_Program tp
				WHERE tp.ProgramId = @ProgramId)
		BEGIN
			SELECT
				*
			FROM TB_Program tp
			WHERE tp.ProgramId = @ProgramId;
			SET @returnflag = 1;
		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Program_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TB_Program_Save] @ProgramId INT NULL = 0,
@ProgramName NVARCHAR(255)
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    IF EXISTS (SELECT
          1
        FROM dbo.TB_Program
        WHERE ProgramId = @ProgramId)
    BEGIN

      UPDATE TB_Program
      SET ProgramId = @ProgramId
         ,ProgramName = @ProgramName
      WHERE ProgramId = @ProgramId;
      SET @returnflag = 2;
    END
    ELSE

    BEGIN
      SELECT
        @ProgramId = ISNULL(MAX(tp.ProgramId), 0) + 1
      FROM TB_Program tp;
      INSERT INTO TB_Program (ProgramId, ProgramName)
        VALUES (@ProgramId, @ProgramName);
      SET @returnflag = 1;
    END
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_ProgramStudy_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TB_ProgramStudy_Delete] @ProgramStudyId INT = 0
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    IF EXISTS (SELECT
          *
        FROM dbo.TB_ProgramStudy tps
        WHERE tps.ProgramStudyId = @ProgramStudyId) AND NOT EXISTS(SELECT 1 FROM TB_Student ts WHERE ts.ProgramStudyId = @ProgramStudyId)
    BEGIN
      DELETE FROM dbo.TB_ProgramStudy
      WHERE ProgramStudyId = @ProgramStudyId;

      SET @returnflag = 1;
    END

  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_ProgramStudy_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TB_ProgramStudy_GetAll]
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    SELECT
      *
    FROM dbo.TB_ProgramStudy tps
    SET @returnflag = 1;
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_ProgramStudy_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TB_ProgramStudy_GetById] @ProgramStudyId INT NULL = 0
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    SELECT
      *
    FROM dbo.TB_ProgramStudy tps
    WHERE tps.ProgramStudyId = @ProgramStudyId;
    SET @returnflag = 1;
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_ProgramStudy_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_ProgramStudy_Save] @ProgramStudyId INT NULL = 0,
@ProgramId INT = 0,
@CollegeDepartmentId INT = 0
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Program tp
				WHERE tp.ProgramId = @ProgramId)
			AND EXISTS (SELECT
					1
				FROM TB_CollegeDepartment tcd
				WHERE tcd.CollegeDepartmentId = @CollegeDepartmentId)
		BEGIN
			IF EXISTS (SELECT
						1
					FROM dbo.TB_ProgramStudy tps
					WHERE tps.ProgramStudyId = @ProgramStudyId)
			BEGIN

				UPDATE TB_ProgramStudy
				SET ProgramId = @ProgramId
				   ,CollegeDepartmentId = @CollegeDepartmentId
				WHERE ProgramStudyId = @ProgramStudyId;
				SET @returnflag = 2;
			END
			ELSE
			BEGIN
				SELECT
					@ProgramStudyId = ISNULL(MAX(tps.ProgramStudyId), 0) + 1
				FROM TB_ProgramStudy tps
				INSERT INTO TB_ProgramStudy (ProgramStudyId, ProgramId, CollegeDepartmentId)
					VALUES (@ProgramStudyId, @ProgramId, @CollegeDepartmentId);
				SET @returnflag = 1;
			END
		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Student_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Student_Delete] @StudentId INT
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Student ts
				WHERE ts.StudentId = ts.StudentId)
			AND NOT EXISTS (SELECT
					1
				FROM TB_Treatise tt
				WHERE tt.StudentId = @StudentId)
		BEGIN

			DELETE FROM dbo.TB_Student
			WHERE StudentId = @StudentId
			SET @returnflag = 1;

		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Student_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Student_GetAll]
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY

		SELECT
			*
		FROM TB_Student;
		SET @returnflag = 1;

	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Student_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Student_GetById] @StudentId INT
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Student ts
				WHERE ts.StudentId = ts.StudentId)
		BEGIN

			SELECT
				*
			FROM TB_Student ts
			WHERE ts.StudentId = @StudentId;
			SET @returnflag = 1;
		
		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Student_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Student_Save] @StudentId INT NULL = 0,
@PersonId INT,
@ChannelId INT,
@RegistrationPromotion NVARCHAR(255),
@DateStudy DATETIME,
@ProgramStudyId INT
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF
			EXISTS (SELECT
					1
				FROM dbo.TB_PersonalInfo tpi
				WHERE tpi.PersonId = @PersonId)
			AND EXISTS (SELECT
					1
				FROM TB_StudentAdmissions tsa
				WHERE tsa.ChannelId = @ChannelId)
			AND EXISTS (SELECT
					1
				FROM TB_ProgramStudy tps
				WHERE tps.ProgramStudyId = @ProgramStudyId)
		BEGIN
			IF EXISTS (SELECT
						1
					FROM dbo.TB_Student ts
					WHERE ts.StudentId = @StudentId)
			BEGIN

				UPDATE dbo.TB_Student
				SET PersonId = @PersonId
				   ,ChannelId = @ChannelId
				   ,RegistrationPromotion = @RegistrationPromotion
				   ,DateStudy = @DateStudy
				   ,ProgramStudyId = @ProgramStudyId
				WHERE StudentId = @StudentId
				SET @returnflag = 2;
			END
			ELSE
			BEGIN
				SELECT
					@StudentId = ISNULL(MAX(ts.StudentId), 0) + 1
				FROM TB_Student ts;

				INSERT INTO dbo.TB_Student (StudentId, PersonId, ChannelId, RegistrationPromotion, DateStudy, ProgramStudyId)
					SELECT
						@StudentId
					   ,@PersonId
					   ,@ChannelId
					   ,@RegistrationPromotion
					   ,@DateStudy
					   ,@ProgramStudyId

				SET @returnflag = 1;
			END

		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;


END
GO
/****** Object:  StoredProcedure [dbo].[TB_StudentAdmissions_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_StudentAdmissions_Delete] @ChannelId INT NULL = 0
AS
BEGIN

	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_StudentAdmissions
				WHERE ChannelId = @ChannelId)
		BEGIN
			DELETE FROM dbo.TB_StudentAdmissions
			WHERE ChannelId = @ChannelId
			SET @returnflag = 1;
		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;

END
GO
/****** Object:  StoredProcedure [dbo].[TB_StudentAdmissions_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_StudentAdmissions_GetAll]
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		SELECT
			*
		FROM TB_StudentAdmissions tsa;
		SET @returnflag = 1;
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;

END
GO
/****** Object:  StoredProcedure [dbo].[TB_StudentAdmissions_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_StudentAdmissions_GetById] @ChannelId INT
AS
BEGIN
	DECLARE @returnflag INT = 0;
	IF EXISTS (SELECT
				1
			FROM dbo.TB_StudentAdmissions
			WHERE ChannelId = @ChannelId)
	BEGIN

		SELECT
			ChannelId
		   ,AcceptanceChannel
		   ,YearOfAdmission
		   ,AdmissionMeal
		   ,UniversityAdmissionOrderNumber
		   ,DateOfUniversityAdmissionOrder
		   ,AdministrativeOrderNumberForAcceptance
		   ,DateAdministrativeOrderOfAcceptance
		FROM dbo.TB_StudentAdmissions
		WHERE ChannelId = @ChannelId
		SET @returnflag = 1;

	END

	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_StudentAdmissions_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_StudentAdmissions_Save] @ChannelId INT NULL = 0,
@AcceptanceChannel NVARCHAR(255),
@YearOfAdmission NVARCHAR(255),
@AdmissionMeal NVARCHAR(255),
@UniversityAdmissionOrderNumber NVARCHAR(255),
@DateOfUniversityAdmissionOrder NVARCHAR(255),
@AdministrativeOrderNumberForAcceptance NVARCHAR(255),
@DateAdministrativeOrderOfAcceptance NVARCHAR(255)
AS
BEGIN

	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_StudentAdmissions
				WHERE ChannelId = @ChannelId)
		BEGIN
			UPDATE dbo.TB_StudentAdmissions
			SET AcceptanceChannel = @AcceptanceChannel
			   ,YearOfAdmission = @YearOfAdmission
			   ,AdmissionMeal = @AdmissionMeal
			   ,UniversityAdmissionOrderNumber = @UniversityAdmissionOrderNumber
			   ,DateOfUniversityAdmissionOrder = @DateOfUniversityAdmissionOrder
			   ,AdministrativeOrderNumberForAcceptance = @AdministrativeOrderNumberForAcceptance
			   ,DateAdministrativeOrderOfAcceptance = @DateAdministrativeOrderOfAcceptance
			WHERE ChannelId = @ChannelId
			SET @returnflag = 2;

		END
		ELSE
		BEGIN
			SELECT
				@ChannelId = ISNULL(MAX(tsa.ChannelId), 0) + 1
			FROM TB_StudentAdmissions tsa;

			INSERT INTO dbo.TB_StudentAdmissions (ChannelId, AcceptanceChannel, YearOfAdmission, AdmissionMeal,
			UniversityAdmissionOrderNumber, DateOfUniversityAdmissionOrder,
			AdministrativeOrderNumberForAcceptance, DateAdministrativeOrderOfAcceptance)
				SELECT
					@ChannelId
				   ,@AcceptanceChannel
				   ,@YearOfAdmission
				   ,@AdmissionMeal
				   ,@UniversityAdmissionOrderNumber
				   ,@DateOfUniversityAdmissionOrder
				   ,@AdministrativeOrderNumberForAcceptance
				   ,@DateAdministrativeOrderOfAcceptance;
			SET @returnflag = 1;

		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;

END
GO
/****** Object:  StoredProcedure [dbo].[TB_StudentSurvey_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--endregion

--region PROCEDURE dbo.usp_TB_StudentSurvey_Delete

CREATE PROC [dbo].[TB_StudentSurvey_Delete] @SurveyId INT
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		DELETE FROM dbo.TB_StudentSurvey
		WHERE SurveyId = @SurveyId;
		SET @returnflag = 1;
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH

	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_StudentSurvey_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_StudentSurvey_GetAll]
AS
BEGIN
	DECLARE @returnflag INT = 0
	BEGIN TRY

		SELECT
			SurveyId
		   ,PersonId
		   ,GrantingTheCertificate
		   ,StudentTotal
		   ,GraduationYear
		   ,CertificateDate
		   ,DocumentNumber
		   ,DocumentDate
		FROM dbo.TB_StudentSurvey

		SET @returnflag = 1;

	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH

	RETURN @returnflag
END
GO
/****** Object:  StoredProcedure [dbo].[TB_StudentSurvey_GetGetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_StudentSurvey_GetGetById] @SurveyId INT
AS
BEGIN
	DECLARE @returnflag INT = 0
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_StudentSurvey tss
				WHERE tss.SurveyId = @SurveyId)
		BEGIN
			SELECT
				SurveyId
			   ,PersonId
			   ,GrantingTheCertificate
			   ,StudentTotal
			   ,GraduationYear
			   ,CertificateDate
			   ,DocumentNumber
			   ,DocumentDate
			FROM dbo.TB_StudentSurvey
			WHERE SurveyId = @SurveyId
			SET @returnflag = 1;

		END


	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH

	RETURN @returnflag
END
GO
/****** Object:  StoredProcedure [dbo].[TB_StudentSurvey_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_StudentSurvey_Save] @SurveyId INT,
@PersonId INT,
@GrantingTheCertificate NVARCHAR(255),
@StudentTotal REAL,
@GraduationYear NVARCHAR(255),
@CertificateDate DATE,
@DocumentNumber INT,
@DocumentDate DATE
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_PersonalInfo tpi
				WHERE tpi.PersonId = @PersonId)
		BEGIN

			IF EXISTS (SELECT
						1
					FROM dbo.TB_StudentSurvey tss
					WHERE tss.SurveyId = @SurveyId)
			BEGIN

				UPDATE dbo.TB_StudentSurvey
				SET PersonId = @PersonId
				   ,GrantingTheCertificate = @GrantingTheCertificate
				   ,StudentTotal = @StudentTotal
				   ,GraduationYear = @GraduationYear
				   ,CertificateDate = @CertificateDate
				   ,DocumentNumber = @DocumentNumber
				   ,DocumentDate = @DocumentDate
				WHERE SurveyId = @SurveyId
				SET @returnflag = 2;
			END
			ELSE
			BEGIN
				SELECT
					@SurveyId = ISNULL(MAX(tss.SurveyId), 0) + 1
				FROM TB_StudentSurvey tss
				INSERT INTO dbo.TB_StudentSurvey (SurveyId, PersonId, GrantingTheCertificate, StudentTotal, GraduationYear,
				CertificateDate, DocumentNumber, DocumentDate)
					SELECT
						@SurveyId
					   ,@PersonId
					   ,@GrantingTheCertificate
					   ,@StudentTotal
					   ,@GraduationYear
					   ,@CertificateDate
					   ,@DocumentNumber
					   ,@DocumentDate;

				SET @returnflag = 1;
			END;
		END;


	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag

END;
GO
/****** Object:  StoredProcedure [dbo].[TB_Syllabus_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Syllabus_Delete] @SyllabusId INT
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN
		DECLARE @returnflag INT = 0;
		BEGIN TRY
			IF EXISTS (SELECT
						1
					FROM dbo.TB_Syllabus ts
					WHERE ts.SyllabusId = @SyllabusId) AND NOT EXISTS (SELECT 1 FROM TB_Teaching tt WHERE tt.SyllabusId =@SyllabusId)
			BEGIN

				DELETE FROM dbo.TB_Syllabus
				WHERE SyllabusId = @SyllabusId
				SET @returnflag = 1;

			END
		END TRY
		BEGIN CATCH
			SET @returnflag = -1;
		END CATCH

		RETURN @returnflag;
	END

GO
/****** Object:  StoredProcedure [dbo].[TB_Syllabus_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Syllabus_GetAll] AS	
BEGIN


	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @returnflag INT = 0;
	BEGIN TRY
		

			SELECT
				SyllabusId
			   ,Subject
			   ,SubjectArb
			   ,Units
			   ,TotalHours
			   ,Semester
			FROM dbo.TB_Syllabus
		
		SET @returnflag = 1;

		
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;

	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Syllabus_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Syllabus_GetById] @SyllabusId INT
AS
BEGIN


	SET NOCOUNT ON
	SET XACT_ABORT ON

	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Syllabus ts
				WHERE ts.SyllabusId = @SyllabusId)
		BEGIN

			SELECT
				SyllabusId
			   ,Subject
			   ,SubjectArb
			   ,Units
			   ,TotalHours
			   ,Semester
			FROM dbo.TB_Syllabus
			WHERE SyllabusId = @SyllabusId
			SET @returnflag = 1;

		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;

	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Syllabus_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Syllabus_Save] 
@SyllabusId INT NULL = 0,
@Subject NVARCHAR(255),
@SubjectArb NVARCHAR(255),
@Units int,
@TotalHours INT,
@Semester INT
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Syllabus ts
				WHERE ts.SyllabusId = @SyllabusId)
		BEGIN
			UPDATE dbo.TB_Syllabus
			SET [Subject] = @Subject
			   ,SubjectArb = @SubjectArb
			   ,Units = @Units
			   ,TotalHours = @TotalHours
			   ,Semester = @Semester
			WHERE SyllabusId = @SyllabusId
			SET @returnflag = 2;
		END
		ELSE
		BEGIN
			SELECT
				@SyllabusId = ISNULL(MAX(ts.SyllabusId), 0) + 1
			FROM TB_Syllabus ts
			INSERT INTO dbo.TB_Syllabus (SyllabusId, [Subject], SubjectArb, Units, TotalHours, Semester)
				SELECT
					@SyllabusId
				   ,@Subject
				   ,@SubjectArb
				   ,@Units
				   ,@TotalHours
				   ,@Semester
			SET @returnflag = 1;
		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;

END
GO
/****** Object:  StoredProcedure [dbo].[TB_Teacher_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Teacher_Delete] @TeacherId INT NULL = 0
AS

BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Teacher tt
				WHERE tt.TeacherId = @TeacherId)
		BEGIN

			DELETE FROM TB_Teacher
			WHERE TeacherId = @TeacherId;
			SET @returnflag = 1;
		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Teacher_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[TB_Teacher_GetAll]
AS
  SET NOCOUNT ON
  SET XACT_ABORT ON

  BEGIN TRAN

  SELECT
    TeacherId
   ,FirstName
   ,SecondName
   ,ThirdName
   ,ForthName
   ,Email
   ,DateOfBirth
   ,PhoneNumber
   ,SexType
   ,HighDiploma
   ,MasterStudent
   ,PhDStudent
   ,StudyTypeName
   ,ScientificTitle
   ,StudyGeneralName
   ,StudyCompetenceName
   ,NBookCurrent
   ,DateBookCurrent
  FROM dbo.TB_Teacher
  COMMIT
GO
/****** Object:  StoredProcedure [dbo].[TB_Teacher_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Teacher_GetById] @TeacherId INT NULL = 0
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY

		SELECT
			*
		FROM dbo.TB_Teacher
		WHERE TeacherId = @TeacherId
		SET @returnflag = 1;
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Teacher_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Teacher_Save] @TeacherId INT NULL = 0,
@FirstName VARCHAR(255),
@SecondName VARCHAR(255),
@ThirdName VARCHAR(255),
@ForthName VARCHAR(255),
@Email VARCHAR(255),
@DateOfBirth DATETIME,
@PhoneNumber VARCHAR(255),
@SexType INT,
@HighDiploma INT,
@MasterStudent INT,
@PhDStudent INT,
@StudyTypeName VARCHAR(255),
@ScientificTitle VARCHAR(255),
@StudyGeneralName VARCHAR(255),
@StudyCompetenceName VARCHAR(255),
@NBookCurrent VARCHAR(255),
@DateBookCurrent VARCHAR(255)
AS
BEGIN

	DECLARE @returnflag INT = 0;
	BEGIN TRY

		IF EXISTS (SELECT
					1
				FROM dbo.TB_Teacher tt
				WHERE tt.TeacherId = @TeacherId)
		BEGIN

			UPDATE dbo.TB_Teacher
			SET FirstName = @FirstName
			   ,SecondName = @SecondName
			   ,ThirdName = @ThirdName
			   ,ForthName = @ForthName
			   ,Email = @Email
			   ,DateOfBirth = @DateOfBirth
			   ,PhoneNumber = @PhoneNumber
			   ,SexType = @SexType
			   ,HighDiploma = @HighDiploma
			   ,MasterStudent = @MasterStudent
			   ,PhDStudent = @PhDStudent
			   ,StudyTypeName = @StudyTypeName
			   ,ScientificTitle = @ScientificTitle
			   ,StudyGeneralName = @StudyGeneralName
			   ,StudyCompetenceName = @StudyCompetenceName
			   ,NBookCurrent = @NBookCurrent
			   ,DateBookCurrent = @DateBookCurrent
			WHERE TeacherId = @TeacherId;

			SET @returnflag = 2;

		END
		ELSE
		BEGIN
			SELECT
				@TeacherId = ISNULL(MAX(TeacherId), 0) + 1
			FROM TB_Teacher;
			INSERT INTO dbo.TB_Teacher (TeacherId, FirstName, SecondName, ThirdName, ForthName, Email, DateOfBirth,
			PhoneNumber, SexType, HighDiploma, MasterStudent, PhDStudent, StudyTypeName,
			ScientificTitle, StudyGeneralName, StudyCompetenceName, NBookCurrent,
			DateBookCurrent)
				VALUES (@TeacherId, @FirstName, @SecondName, @ThirdName, @ForthName, @Email, @DateOfBirth, @PhoneNumber, @SexType, @HighDiploma, @MasterStudent, @PhDStudent, @StudyTypeName, @ScientificTitle, @StudyGeneralName, @StudyCompetenceName, @NBookCurrent, @DateBookCurrent)

			SET @returnflag = 1;
		END
	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END;
GO
/****** Object:  StoredProcedure [dbo].[TB_Teaching_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_Teaching_Delete] @TeachId INT NULL = 0
AS 
BEGIN
DECLARE @returnflag INT  =0;
	BEGIN TRY
	IF EXISTS(
    	SELECT 1
    	FROM dbo.TB_Teaching WHERE TeachId = @TeachId
    ) BEGIN
    DELETE FROM TB_Teaching WHERE TeachId = @TeachId;
    	SET @returnflag =1;
    END
	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Teaching_Get]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_Teaching_Get] (@TeachId INT NULL = 0)
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Teaching tt
				WHERE tt.TeachId = @TeachId)
		BEGIN
			SELECT
				*
			FROM dbo.TB_Teaching tt
			WHERE tt.TeachId = @TeachId
			SET @returnflag = 1;
		END

		ELSE
		BEGIN
			SELECT
				*
			FROM dbo.TB_Teaching tt
			SET @returnflag = 2;
		END

	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;

END

GO
/****** Object:  StoredProcedure [dbo].[TB_Teaching_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[TB_Teaching_GetById] (@TeachId INT NULL = 0)
	AS
	BEGIN
		DECLARE @returnflag INT = 0;
		BEGIN TRY
			IF EXISTS (SELECT
						1
					FROM dbo.TB_Teaching tt
					WHERE tt.TeachId = @TeachId)
			BEGIN
				SELECT
					*
				FROM dbo.TB_Teaching tt
				WHERE tt.TeachId = @TeachId
				SET @returnflag = 1;
			END
		END TRY
		BEGIN CATCH
			SET @returnflag = -1;

		END CATCH
		RETURN @returnflag
	END
GO
/****** Object:  StoredProcedure [dbo].[TB_Teaching_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TB_Teaching_Save] (@TeachId INT NULL = 0,
@TeacherId INT,
@SyllabusId INT)
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Teacher tt
				WHERE tt.TeacherId = @TeacherId)
			AND EXISTS (SELECT
					1
				FROM TB_Syllabus ts
				WHERE ts.SyllabusId = @SyllabusId)
		BEGIN

			IF EXISTS (SELECT
						1
					FROM dbo.TB_Teaching tt
					WHERE tt.TeachId = @TeachId)
			BEGIN

				UPDATE TB_Teaching
				SET TeacherId = @TeacherId
				   ,SyllabusId = @SyllabusId
				WHERE TeachId = @TeachId;
				SET @returnflag = 2;

			END
			ELSE
			BEGIN
				SELECT
					@TeachId = ISNULL(MAX(tt.TeachId), 0) + 1
				FROM TB_Teaching tt;
				INSERT INTO TB_Teaching (TeachId, TeacherId, SyllabusId)
					VALUES (@TeachId, @TeacherId, @SyllabusId);

				SET @returnflag = 1;
			END

		END



	END TRY
	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;

END

GO
/****** Object:  StoredProcedure [dbo].[TB_Treatise_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Treatise_Delete] @TreatiseId INT NULL = 0
AS
BEGIN
	DECLARE @returnflag INT = 0;
	IF EXISTS (SELECT
				1
			FROM dbo.TB_Treatise tt
			WHERE tt.TreatiseId = @TreatiseId)
	BEGIN
		DELETE FROM TB_Treatise
		WHERE TreatiseId = @TreatiseId;
		SET @returnflag = 1;

	END
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Treatise_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Treatise_GetAll]
AS
BEGIN
	DECLARE @returnflag INT = 0;
	SELECT
		TreatiseId
	   ,ThesisTitle
	   ,DateOfCommencementOfSupervision
	   ,SupervisorAssignmentOrderNumber
	   ,TheDateOfTheOrderAppointingSupervisor
	   ,NameAndTitleOfTheSupervisor
	   ,SupervisorSpecialty
	   ,MessageDelivery
	   ,DiscussionCommitteeOrderNumber
	   ,DateOfTheDiscussionCommitteeOrder
	   ,CourseRate
	   ,DegreeOfDiscussion
	   ,FinalGraduationRate
	   ,UniversityOrderNumberGrantingTheCertificate
	   ,DateOfTheUniversityOrderGrantingTheCertificate
	   ,AdministrativeOrderNumberForTheFirstExtension
	   ,DateOfTheAdministrativeOrderForTheFirstExtension
	   ,AdministrativeOrderNumberForTheSecondExtension
	   ,DateOfTheAdministrativeOrderForTheSecondExtension
	   ,Notes
	   ,StudentId
	FROM dbo.TB_Treatise
	SET @returnflag = 1;

	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Treatise_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Treatise_GetById]  @TreatiseId INT NULL =0
AS
BEGIN
DECLARE @returnflag INT =0;
IF EXISTS(
	SELECT 1
	FROM dbo.TB_Treatise tt WHERE tt.TreatiseId = @TreatiseId
) BEGIN

		 SELECT TreatiseId, ThesisTitle, DateOfCommencementOfSupervision, SupervisorAssignmentOrderNumber, TheDateOfTheOrderAppointingSupervisor, NameAndTitleOfTheSupervisor, SupervisorSpecialty, MessageDelivery, DiscussionCommitteeOrderNumber, DateOfTheDiscussionCommitteeOrder, CourseRate, DegreeOfDiscussion, FinalGraduationRate, UniversityOrderNumberGrantingTheCertificate, DateOfTheUniversityOrderGrantingTheCertificate, AdministrativeOrderNumberForTheFirstExtension, DateOfTheAdministrativeOrderForTheFirstExtension, AdministrativeOrderNumberForTheSecondExtension, DateOfTheAdministrativeOrderForTheSecondExtension, Notes, StudentId
    FROM   dbo.TB_Treatise
    WHERE  TreatiseId = @TreatiseId ;
	SET @returnflag=1;

END
RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Treatise_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Treatise_Save] @TreatiseId INT NULL,
@ThesisTitle NVARCHAR(1000),
@DateOfCommencementOfSupervision DATE,
@SupervisorAssignmentOrderNumber VARCHAR(255),
@TheDateOfTheOrderAppointingSupervisor DATE,
@NameAndTitleOfTheSupervisor NVARCHAR(255),
@SupervisorSpecialty NVARCHAR(255),
@MessageDelivery BIT,
@DiscussionCommitteeOrderNumber NVARCHAR(255),
@DateOfTheDiscussionCommitteeOrder DATE,
@CourseRate REAL,
@DegreeOfDiscussion REAL,
@FinalGraduationRate REAL,
@UniversityOrderNumberGrantingTheCertificate NVARCHAR(255),
@DateOfTheUniversityOrderGrantingTheCertificate DATE,
@AdministrativeOrderNumberForTheFirstExtension NVARCHAR(255),
@DateOfTheAdministrativeOrderForTheFirstExtension DATE,
@AdministrativeOrderNumberForTheSecondExtension NVARCHAR(255),
@DateOfTheAdministrativeOrderForTheSecondExtension DATE,
@Notes NVARCHAR(4000),
@StudentId INT
AS
BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Treatise tt
				WHERE tt.TreatiseId = @TreatiseId)
		BEGIN
			UPDATE dbo.TB_Treatise
			SET ThesisTitle = @ThesisTitle
			   ,DateOfCommencementOfSupervision = @DateOfCommencementOfSupervision
			   ,SupervisorAssignmentOrderNumber = @SupervisorAssignmentOrderNumber
			   ,TheDateOfTheOrderAppointingSupervisor = @TheDateOfTheOrderAppointingSupervisor
			   ,NameAndTitleOfTheSupervisor = @NameAndTitleOfTheSupervisor
			   ,SupervisorSpecialty = @SupervisorSpecialty
			   ,MessageDelivery = @MessageDelivery
			   ,DiscussionCommitteeOrderNumber = @DiscussionCommitteeOrderNumber
			   ,DateOfTheDiscussionCommitteeOrder = @DateOfTheDiscussionCommitteeOrder
			   ,CourseRate = @CourseRate
			   ,DegreeOfDiscussion = @DegreeOfDiscussion
			   ,FinalGraduationRate = @FinalGraduationRate
			   ,UniversityOrderNumberGrantingTheCertificate = @UniversityOrderNumberGrantingTheCertificate
			   ,DateOfTheUniversityOrderGrantingTheCertificate = @DateOfTheUniversityOrderGrantingTheCertificate
			   ,AdministrativeOrderNumberForTheFirstExtension = @AdministrativeOrderNumberForTheFirstExtension
			   ,DateOfTheAdministrativeOrderForTheFirstExtension = @DateOfTheAdministrativeOrderForTheFirstExtension
			   ,AdministrativeOrderNumberForTheSecondExtension = @AdministrativeOrderNumberForTheSecondExtension
			   ,DateOfTheAdministrativeOrderForTheSecondExtension = @DateOfTheAdministrativeOrderForTheSecondExtension
			   ,Notes = @Notes
			   ,StudentId = @StudentId
			WHERE TreatiseId = @TreatiseId
			SET @returnflag = 2;
		END
		ELSE
		BEGIN
			SELECT
				@TreatiseId = ISNULL(MAX(tt.ThesisTitle), 0) + 1
			FROM TB_Treatise tt;
			INSERT INTO dbo.TB_Treatise (TreatiseId, ThesisTitle, DateOfCommencementOfSupervision, SupervisorAssignmentOrderNumber,
			TheDateOfTheOrderAppointingSupervisor, NameAndTitleOfTheSupervisor,
			SupervisorSpecialty, MessageDelivery, DiscussionCommitteeOrderNumber,
			DateOfTheDiscussionCommitteeOrder, CourseRate, DegreeOfDiscussion,
			FinalGraduationRate, UniversityOrderNumberGrantingTheCertificate, DateOfTheUniversityOrderGrantingTheCertificate,
			AdministrativeOrderNumberForTheFirstExtension, DateOfTheAdministrativeOrderForTheFirstExtension,
			AdministrativeOrderNumberForTheSecondExtension, DateOfTheAdministrativeOrderForTheSecondExtension,
			Notes, StudentId)
				SELECT
					@TreatiseId
				   ,@ThesisTitle
				   ,@DateOfCommencementOfSupervision
				   ,@SupervisorAssignmentOrderNumber
				   ,@TheDateOfTheOrderAppointingSupervisor
				   ,@NameAndTitleOfTheSupervisor
				   ,@SupervisorSpecialty
				   ,@MessageDelivery
				   ,@DiscussionCommitteeOrderNumber
				   ,@DateOfTheDiscussionCommitteeOrder
				   ,@CourseRate
				   ,@DegreeOfDiscussion
				   ,@FinalGraduationRate
				   ,@UniversityOrderNumberGrantingTheCertificate
				   ,@DateOfTheUniversityOrderGrantingTheCertificate
				   ,@AdministrativeOrderNumberForTheFirstExtension
				   ,@DateOfTheAdministrativeOrderForTheFirstExtension
				   ,@AdministrativeOrderNumberForTheSecondExtension
				   ,@DateOfTheAdministrativeOrderForTheSecondExtension
				   ,@Notes
				   ,@StudentId
			SET @returnflag = 1;

		END
	END TRY
	BEGIN
	CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_University_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TB_University_Delete] @universityId INT
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
    IF EXISTS (SELECT
          1
        FROM [dbo].[TB_University]
        WHERE [universityId] = @universityId)
    BEGIN
      DELETE FROM [dbo].[TB_University]
      WHERE [universityId] = @universityId
      SET @returnflag = 1;
    END
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_University_GetAll]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Stored procedure for inserting or updating a record

-- Stored procedure for selecting all records
CREATE   PROCEDURE [dbo].[TB_University_GetAll]
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY
      SELECT
        [UniversityId]
       ,[UniversityName]
      FROM [dbo].[TB_University]
      SET @returnflag = 1;
    
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;

END
GO
/****** Object:  StoredProcedure [dbo].[TB_University_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[TB_University_GetById] @UniversityId INT NULL = 0
AS
BEGIN
  SELECT
    [UniversityId]
   ,[UniversityName]
  FROM [dbo].[TB_University]
  WHERE [UniversityId] = @UniversityId

END
GO
/****** Object:  StoredProcedure [dbo].[TB_University_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[TB_University_Save] @UniversityId INT,
@UniversityName NVARCHAR(255)
AS
BEGIN
  DECLARE @returnflag INT = 0;
  BEGIN TRY

    IF EXISTS (SELECT
          1
        FROM [dbo].[TB_University]
        WHERE [UniversityId] = @UniversityId)
    BEGIN
      -- Update existing record
      UPDATE [dbo].[TB_University]
      SET [UniversityName] = @UniversityName
      WHERE [UniversityId] = @UniversityId
      SET @returnflag = 2;
    END
    ELSE
    BEGIN
      -- Insert new record
      SELECT
        @UniversityId = ISNULL(MAX(UniversityId), 0) + 1
      FROM TB_University;
      INSERT INTO [dbo].[TB_University] ([UniversityId], [UniversityName])
        VALUES (@UniversityId, @UniversityName)
      SET @returnflag = 1;
    END
  END TRY
  BEGIN CATCH
    SET @returnflag = -1;
  END CATCH
  RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Users_Delete]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Users_Delete] @UserId INT NULL = 0
AS

BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Users tu
				WHERE tu.UserId = @UserId)
		BEGIN
			DELETE FROM dbo.TB_Users
			WHERE UserId = @UserId;
			SET @returnflag = 1
		END
	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Users_Get]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Users_Get] 
-- @UserId INT NULL = 0
AS

BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		SELECT * FROM	TB_Users tu;
			SET @returnflag = 1
	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Users_GetById]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Users_GetById] @UserId INT NULL = 0
AS

BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Users tu
				WHERE tu.UserId = @UserId)
		BEGIN
			SELECT
				*
			FROM TB_Users tu
			WHERE tu.UserId = @UserId;
			SET @returnflag = 1
		END
	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Users_Login]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Users_Login] @UserName NVARCHAR(255), @Password NVARCHAR(255)
AS
BEGIN
	IF EXISTS (SELECT
				1
			FROM dbo.TB_Users tu
			WHERE tu.UserName = @UserName
			AND tu.Password = @Password)
	BEGIN
		RETURN 1;
	END
	RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[TB_Users_Save]    Script Date: 2/5/2024 6:02:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TB_Users_Save] @UserId INT NULL = 0,
@UserName NVARCHAR(255),
@Password NVARCHAR(255)
AS

BEGIN
	DECLARE @returnflag INT = 0;
	BEGIN TRY
		IF EXISTS (SELECT
					1
				FROM dbo.TB_Users
				WHERE UserId = @UserId)
		BEGIN

			UPDATE TB_Users
			SET UserName = @UserName
			   ,[Password] = @Password
			WHERE UserId = @UserId;
			SET @returnflag = 2;
		END
		ELSE
		BEGIN
			SELECT
				@UserId = ISNULL(MAX(tu.UserId), 0) + 1
			FROM TB_Users tu;
			INSERT INTO TB_Users (UserId, UserName, [Password])
				VALUES (@UserId, @UserName, @Password);
			SET @returnflag = 1;
		END

	END TRY

	BEGIN CATCH
		SET @returnflag = -1;
	END CATCH
	RETURN @returnflag;
END
GO
USE [master]
GO
ALTER DATABASE [StudentSystem] SET  READ_WRITE 
GO
