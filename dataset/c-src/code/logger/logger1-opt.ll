; ModuleID = 'logger1-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/logger/logger1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__CPROVER_thread_priorities = constant [2 x i32] [i32 5, i32 2], align 4
@.str = private unnamed_addr constant [20 x i8] c"c::task_communicate\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"c::task_measure\00", align 1
@__CPROVER_threads = global [2 x i8*] [i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0)], align 16
@systemState = common global i32 0, align 4
@numberOfRecords = common global i32 0, align 4
@intervalCounter = common global i32 0, align 4
@tickCounter = common global i32 0, align 4
@startTime = common global i32 0, align 4
@interval = common global i32 0, align 4
@records = common global i32 0, align 4
@cnt1 = common global i32 0, align 4
@cmd = common global i32 0, align 4
@rspStatus = common global i32 0, align 4
@decodingStatus = common global i32 0, align 4
@sendit = common global i32 0, align 4
@msgBuffer = common global [64 x i32] zeroinitializer, align 16
@cnt2 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4

; Function Attrs: nounwind
declare i64 @strtol(i8*, i8**, i32) #0

; Function Attrs: nounwind
declare i64 @strtoll(i8*, i8**, i32) #0

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
declare double @strtod(i8*, i8**) #0

; Function Attrs: nounwind uwtable
define void @stop() #2 !dbg !7 {
  store i32 0, i32* @systemState, align 4, !dbg !9, !tbaa !10
  ret void, !dbg !14
}

; Function Attrs: nounwind uwtable
define void @start(i32 %0, i32 %1) #2 !dbg !15 {
  %3 = load i32, i32* @numberOfRecords, align 4, !dbg !16, !tbaa !10
  %4 = add nsw i32 %3, 1, !dbg !17
  %5 = icmp sge i32 %4, 64, !dbg !18
  br i1 %5, label %6, label %7, !dbg !16

6:                                                ; preds = %2
  store i32 0, i32* @systemState, align 4, !dbg !19, !tbaa !10
  br label %7, !dbg !20

7:                                                ; preds = %6, %2
  store i32 0, i32* @intervalCounter, align 4, !dbg !21, !tbaa !10
  store i32 0, i32* @tickCounter, align 4, !dbg !22, !tbaa !10
  store i32 0, i32* @numberOfRecords, align 4, !dbg !23, !tbaa !10
  store i32 %0, i32* @startTime, align 4, !dbg !24, !tbaa !10
  store i32 %1, i32* @interval, align 4, !dbg !25, !tbaa !10
  store i32 1, i32* @systemState, align 4, !dbg !26, !tbaa !10
  ret void, !dbg !27
}

; Function Attrs: nounwind uwtable
define void @task_isr_1() #2 !dbg !28 {
  %1 = load i32, i32* @tickCounter, align 4, !dbg !29, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !29
  store i32 %2, i32* @tickCounter, align 4, !dbg !29, !tbaa !10
  %3 = load i32, i32* @tickCounter, align 4, !dbg !30, !tbaa !10
  %4 = load i32, i32* @interval, align 4, !dbg !31, !tbaa !10
  store i32 0, i32* @tickCounter, align 4, !dbg !32, !tbaa !10
  %5 = load i32, i32* @intervalCounter, align 4, !dbg !33, !tbaa !10
  %6 = add nsw i32 %5, 1, !dbg !33
  store i32 %6, i32* @intervalCounter, align 4, !dbg !33, !tbaa !10
  store i32 1, i32* @records, align 4, !dbg !34, !tbaa !10
  %7 = load i32, i32* @numberOfRecords, align 4, !dbg !35, !tbaa !10
  %8 = add nsw i32 %7, 1, !dbg !35
  store i32 %8, i32* @numberOfRecords, align 4, !dbg !35, !tbaa !10
  %9 = load i32, i32* @cnt1, align 4, !dbg !36, !tbaa !10
  %10 = add nsw i32 %9, 1, !dbg !36
  store i32 %10, i32* @cnt1, align 4, !dbg !36, !tbaa !10
  ret void, !dbg !37
}

; Function Attrs: nounwind uwtable
define void @task_isr_2() #2 !dbg !38 {
  %1 = call i32 @rand() #3, !dbg !39
  %2 = srem i32 %1, 4, !dbg !40
  %3 = add nsw i32 %2, 1, !dbg !41
  store i32 %3, i32* @cmd, align 4, !dbg !42, !tbaa !10
  %4 = call i32 @rand() #3, !dbg !43
  %5 = srem i32 %4, 2, !dbg !44
  %6 = add nsw i32 %5, 1, !dbg !45
  store i32 %6, i32* @rspStatus, align 4, !dbg !46, !tbaa !10
  store i32 0, i32* @decodingStatus, align 4, !dbg !47, !tbaa !10
  %7 = load i32, i32* @cmd, align 4, !dbg !48, !tbaa !10
  %8 = icmp eq i32 %7, 2, !dbg !49
  br i1 %8, label %18, label %9, !dbg !50

9:                                                ; preds = %0
  %10 = load i32, i32* @cmd, align 4, !dbg !51, !tbaa !10
  %11 = icmp eq i32 %10, 3, !dbg !52
  br i1 %11, label %18, label %12, !dbg !53

12:                                               ; preds = %9
  %13 = load i32, i32* @cmd, align 4, !dbg !54, !tbaa !10
  %14 = icmp eq i32 %13, 4, !dbg !55
  br i1 %14, label %18, label %15, !dbg !56

15:                                               ; preds = %12
  %16 = load i32, i32* @cmd, align 4, !dbg !57, !tbaa !10
  %17 = icmp eq i32 %16, 1, !dbg !58
  br i1 %17, label %18, label %19, !dbg !48

18:                                               ; preds = %15, %12, %9, %0
  store i32 1, i32* @decodingStatus, align 4, !dbg !59, !tbaa !10
  br label %19, !dbg !60

19:                                               ; preds = %18, %15
  %20 = load i32, i32* @rspStatus, align 4, !dbg !61, !tbaa !10
  %21 = icmp eq i32 %20, 1, !dbg !62
  br i1 %21, label %22, label %58, !dbg !61

22:                                               ; preds = %19
  %23 = load i32, i32* @cmd, align 4, !dbg !63, !tbaa !10
  %24 = icmp eq i32 %23, 2, !dbg !64
  br i1 %24, label %25, label %31, !dbg !63

25:                                               ; preds = %22
  %26 = load i32, i32* @systemState, align 4, !dbg !65, !tbaa !10
  %27 = icmp ne i32 %26, 1, !dbg !66
  br i1 %27, label %28, label %29, !dbg !65

28:                                               ; preds = %25
  store i32 0, i32* @rspStatus, align 4, !dbg !67, !tbaa !10
  br label %30, !dbg !68

29:                                               ; preds = %25
  store i32 0, i32* @systemState, align 4, !dbg !69, !tbaa !10
  br label %30

30:                                               ; preds = %29, %28
  store i32 1, i32* @sendit, align 4, !dbg !70, !tbaa !10
  br label %31, !dbg !71

31:                                               ; preds = %30, %22
  %32 = load i32, i32* @cmd, align 4, !dbg !72, !tbaa !10
  %33 = icmp eq i32 %32, 3, !dbg !73
  br i1 %33, label %34, label %35, !dbg !72

34:                                               ; preds = %31
  store i32 1, i32* @sendit, align 4, !dbg !74, !tbaa !10
  br label %35, !dbg !75

35:                                               ; preds = %34, %31
  %36 = load i32, i32* @cmd, align 4, !dbg !76, !tbaa !10
  %37 = icmp eq i32 %36, 4, !dbg !77
  br i1 %37, label %38, label %39, !dbg !76

38:                                               ; preds = %35
  store i32 1, i32* @sendit, align 4, !dbg !78, !tbaa !10
  br label %39, !dbg !79

39:                                               ; preds = %38, %35
  %40 = load i32, i32* @cmd, align 4, !dbg !80, !tbaa !10
  %41 = icmp eq i32 %40, 0, !dbg !81
  br i1 %41, label %42, label %57, !dbg !80

42:                                               ; preds = %39
  %43 = load i32, i32* @systemState, align 4, !dbg !82, !tbaa !10
  %44 = icmp ne i32 %43, 0, !dbg !83
  br i1 %44, label %45, label %46, !dbg !82

45:                                               ; preds = %42
  store i32 0, i32* @rspStatus, align 4, !dbg !84, !tbaa !10
  br label %56, !dbg !85

46:                                               ; preds = %42
  %47 = load i32, i32* @numberOfRecords, align 4, !dbg !86, !tbaa !10
  %48 = add nsw i32 %47, 1, !dbg !87
  %49 = icmp sge i32 %48, 64, !dbg !88
  br i1 %49, label %50, label %51, !dbg !89

50:                                               ; preds = %46
  store i32 0, i32* @systemState, align 4, !dbg !90, !tbaa !10
  br label %51, !dbg !91

51:                                               ; preds = %50, %46
  store i32 0, i32* @intervalCounter, align 4, !dbg !92, !tbaa !10
  store i32 0, i32* @tickCounter, align 4, !dbg !93, !tbaa !10
  store i32 0, i32* @numberOfRecords, align 4, !dbg !94, !tbaa !10
  store i32 1, i32* @startTime, align 4, !dbg !95, !tbaa !10
  store i32 1, i32* @interval, align 4, !dbg !96, !tbaa !10
  store i32 1, i32* @systemState, align 4, !dbg !97, !tbaa !10
  %52 = load i32, i32* @numberOfRecords, align 4, !dbg !98, !tbaa !10
  %53 = icmp ne i32 %52, 0, !dbg !99
  br i1 %53, label %54, label %55, !dbg !98

54:                                               ; preds = %51
  br label %55, !dbg !100

55:                                               ; preds = %54, %51
  store i32 1, i32* @sendit, align 4, !dbg !101, !tbaa !10
  br label %56

56:                                               ; preds = %55, %45
  br label %57, !dbg !102

57:                                               ; preds = %56, %39
  br label %58, !dbg !103

58:                                               ; preds = %57, %19
  ret void, !dbg !104
}

; Function Attrs: nounwind
declare i32 @rand() #0

; Function Attrs: nounwind uwtable
define i32 @svp_simple_013_001_main() #2 !dbg !105 {
  store i32 0, i32* @systemState, align 4, !dbg !106, !tbaa !10
  ret i32 0, !dbg !107
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/logger/logger1.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/logger")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "stop", scope: !1, file: !1, line: 53, type: !8, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 56, column: 17, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 57, column: 1, scope: !7)
!15 = distinct !DISubprogram(name: "start", scope: !1, file: !1, line: 59, type: !8, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!16 = !DILocation(line: 61, column: 9, scope: !15)
!17 = !DILocation(line: 61, column: 24, scope: !15)
!18 = !DILocation(line: 61, column: 27, scope: !15)
!19 = !DILocation(line: 63, column: 21, scope: !15)
!20 = !DILocation(line: 64, column: 5, scope: !15)
!21 = !DILocation(line: 65, column: 21, scope: !15)
!22 = !DILocation(line: 66, column: 17, scope: !15)
!23 = !DILocation(line: 67, column: 21, scope: !15)
!24 = !DILocation(line: 68, column: 15, scope: !15)
!25 = !DILocation(line: 69, column: 14, scope: !15)
!26 = !DILocation(line: 70, column: 17, scope: !15)
!27 = !DILocation(line: 73, column: 1, scope: !15)
!28 = distinct !DISubprogram(name: "task_isr_1", scope: !1, file: !1, line: 75, type: !8, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 79, column: 20, scope: !28)
!30 = !DILocation(line: 80, column: 31, scope: !28)
!31 = !DILocation(line: 81, column: 28, scope: !28)
!32 = !DILocation(line: 84, column: 21, scope: !28)
!33 = !DILocation(line: 85, column: 24, scope: !28)
!34 = !DILocation(line: 87, column: 17, scope: !28)
!35 = !DILocation(line: 88, column: 24, scope: !28)
!36 = !DILocation(line: 89, column: 13, scope: !28)
!37 = !DILocation(line: 91, column: 1, scope: !28)
!38 = distinct !DISubprogram(name: "task_isr_2", scope: !1, file: !1, line: 94, type: !8, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 101, column: 15, scope: !38)
!40 = !DILocation(line: 101, column: 22, scope: !38)
!41 = !DILocation(line: 101, column: 25, scope: !38)
!42 = !DILocation(line: 101, column: 13, scope: !38)
!43 = !DILocation(line: 102, column: 21, scope: !38)
!44 = !DILocation(line: 102, column: 28, scope: !38)
!45 = !DILocation(line: 102, column: 31, scope: !38)
!46 = !DILocation(line: 102, column: 19, scope: !38)
!47 = !DILocation(line: 103, column: 24, scope: !38)
!48 = !DILocation(line: 105, column: 12, scope: !38)
!49 = !DILocation(line: 105, column: 15, scope: !38)
!50 = !DILocation(line: 105, column: 19, scope: !38)
!51 = !DILocation(line: 105, column: 22, scope: !38)
!52 = !DILocation(line: 105, column: 25, scope: !38)
!53 = !DILocation(line: 105, column: 29, scope: !38)
!54 = !DILocation(line: 106, column: 17, scope: !38)
!55 = !DILocation(line: 106, column: 20, scope: !38)
!56 = !DILocation(line: 106, column: 24, scope: !38)
!57 = !DILocation(line: 106, column: 27, scope: !38)
!58 = !DILocation(line: 106, column: 30, scope: !38)
!59 = !DILocation(line: 107, column: 28, scope: !38)
!60 = !DILocation(line: 108, column: 9, scope: !38)
!61 = !DILocation(line: 110, column: 13, scope: !38)
!62 = !DILocation(line: 110, column: 23, scope: !38)
!63 = !DILocation(line: 111, column: 17, scope: !38)
!64 = !DILocation(line: 111, column: 21, scope: !38)
!65 = !DILocation(line: 112, column: 21, scope: !38)
!66 = !DILocation(line: 112, column: 33, scope: !38)
!67 = !DILocation(line: 113, column: 31, scope: !38)
!68 = !DILocation(line: 114, column: 17, scope: !38)
!69 = !DILocation(line: 116, column: 33, scope: !38)
!70 = !DILocation(line: 119, column: 24, scope: !38)
!71 = !DILocation(line: 120, column: 13, scope: !38)
!72 = !DILocation(line: 121, column: 17, scope: !38)
!73 = !DILocation(line: 121, column: 21, scope: !38)
!74 = !DILocation(line: 123, column: 23, scope: !38)
!75 = !DILocation(line: 124, column: 13, scope: !38)
!76 = !DILocation(line: 125, column: 17, scope: !38)
!77 = !DILocation(line: 125, column: 21, scope: !38)
!78 = !DILocation(line: 127, column: 23, scope: !38)
!79 = !DILocation(line: 128, column: 13, scope: !38)
!80 = !DILocation(line: 129, column: 17, scope: !38)
!81 = !DILocation(line: 129, column: 21, scope: !38)
!82 = !DILocation(line: 130, column: 21, scope: !38)
!83 = !DILocation(line: 130, column: 33, scope: !38)
!84 = !DILocation(line: 131, column: 31, scope: !38)
!85 = !DILocation(line: 132, column: 17, scope: !38)
!86 = !DILocation(line: 133, column: 35, scope: !38)
!87 = !DILocation(line: 133, column: 51, scope: !38)
!88 = !DILocation(line: 134, column: 33, scope: !38)
!89 = !DILocation(line: 134, column: 25, scope: !38)
!90 = !DILocation(line: 135, column: 37, scope: !38)
!91 = !DILocation(line: 136, column: 21, scope: !38)
!92 = !DILocation(line: 137, column: 37, scope: !38)
!93 = !DILocation(line: 138, column: 33, scope: !38)
!94 = !DILocation(line: 139, column: 37, scope: !38)
!95 = !DILocation(line: 140, column: 31, scope: !38)
!96 = !DILocation(line: 141, column: 30, scope: !38)
!97 = !DILocation(line: 142, column: 33, scope: !38)
!98 = !DILocation(line: 144, column: 25, scope: !38)
!99 = !DILocation(line: 144, column: 41, scope: !38)
!100 = !DILocation(line: 146, column: 21, scope: !38)
!101 = !DILocation(line: 148, column: 28, scope: !38)
!102 = !DILocation(line: 151, column: 13, scope: !38)
!103 = !DILocation(line: 152, column: 9, scope: !38)
!104 = !DILocation(line: 155, column: 1, scope: !38)
!105 = distinct !DISubprogram(name: "svp_simple_013_001_main", scope: !1, file: !1, line: 159, type: !8, scopeLine: 159, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 160, column: 17, scope: !105)
!107 = !DILocation(line: 169, column: 5, scope: !105)
