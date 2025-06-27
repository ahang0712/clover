; ModuleID = 'logger2-opt.bc'
source_filename = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/logger/logger2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__CPROVER_thread_priorities = constant [3 x i32] [i32 5, i32 2, i32 3], align 4
@.str = private unnamed_addr constant [20 x i8] c"c::task_communicate\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"c::task_measure1\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"c::task_measure2\00", align 1
@__CPROVER_threads = global [3 x i8*] [i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0)], align 16
@systemState = common global i32 0, align 4
@numberOfRecords = common global i32 0, align 4
@intervalCounter = common global i32 0, align 4
@tickCounter = common global i32 0, align 4
@startTime = common global i32 0, align 4
@interval = common global i32 0, align 4
@cnt1 = common global i32 0, align 4
@records = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@cnt3 = common global i32 0, align 4
@cmd = common global i32 0, align 4
@rspStatus = common global i32 0, align 4
@decodingStatus = common global i32 0, align 4
@sendit = common global i32 0, align 4
@msgBuffer = common global [64 x i32] zeroinitializer, align 16

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
  %1 = load i32, i32* @cnt1, align 4, !dbg !29, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !29
  store i32 %2, i32* @cnt1, align 4, !dbg !29, !tbaa !10
  %3 = load i32, i32* @tickCounter, align 4, !dbg !30, !tbaa !10
  %4 = add nsw i32 %3, 1, !dbg !30
  store i32 %4, i32* @tickCounter, align 4, !dbg !30, !tbaa !10
  %5 = load i32, i32* @tickCounter, align 4, !dbg !31, !tbaa !10
  %6 = load i32, i32* @interval, align 4, !dbg !32, !tbaa !10
  store i32 0, i32* @tickCounter, align 4, !dbg !33, !tbaa !10
  %7 = load i32, i32* @tickCounter, align 4, !dbg !34, !tbaa !10
  %8 = icmp ne i32 %7, 0, !dbg !35
  br i1 %8, label %9, label %10, !dbg !34

9:                                                ; preds = %0
  br label %10, !dbg !36

10:                                               ; preds = %9, %0
  %11 = load i32, i32* @intervalCounter, align 4, !dbg !37, !tbaa !10
  %12 = add nsw i32 %11, 1, !dbg !37
  store i32 %12, i32* @intervalCounter, align 4, !dbg !37, !tbaa !10
  store i32 1, i32* @records, align 4, !dbg !38, !tbaa !10
  %13 = load i32, i32* @numberOfRecords, align 4, !dbg !39, !tbaa !10
  %14 = add nsw i32 %13, 1, !dbg !39
  store i32 %14, i32* @numberOfRecords, align 4, !dbg !39, !tbaa !10
  ret void, !dbg !40
}

; Function Attrs: nounwind uwtable
define void @task_isr_2() #2 !dbg !41 {
  %1 = load i32, i32* @cnt2, align 4, !dbg !42, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !42
  store i32 %2, i32* @cnt2, align 4, !dbg !42, !tbaa !10
  store i32 0, i32* @tickCounter, align 4, !dbg !43, !tbaa !10
  %3 = load i32, i32* @tickCounter, align 4, !dbg !44, !tbaa !10
  %4 = icmp ne i32 %3, 0, !dbg !45
  br i1 %4, label %5, label %6, !dbg !44

5:                                                ; preds = %0
  br label %6, !dbg !46

6:                                                ; preds = %5, %0
  ret void, !dbg !47
}

; Function Attrs: nounwind uwtable
define void @task_isr_3() #2 !dbg !48 {
  %1 = load i32, i32* @cnt3, align 4, !dbg !49, !tbaa !10
  %2 = add nsw i32 %1, 1, !dbg !49
  store i32 %2, i32* @cnt3, align 4, !dbg !49, !tbaa !10
  %3 = call i32 @rand() #3, !dbg !50
  %4 = srem i32 %3, 4, !dbg !51
  %5 = add nsw i32 %4, 1, !dbg !52
  store i32 %5, i32* @cmd, align 4, !dbg !53, !tbaa !10
  %6 = call i32 @rand() #3, !dbg !54
  %7 = srem i32 %6, 2, !dbg !55
  %8 = add nsw i32 %7, 1, !dbg !56
  store i32 %8, i32* @rspStatus, align 4, !dbg !57, !tbaa !10
  store i32 0, i32* @decodingStatus, align 4, !dbg !58, !tbaa !10
  %9 = load i32, i32* @cmd, align 4, !dbg !59, !tbaa !10
  %10 = icmp eq i32 %9, 2, !dbg !60
  br i1 %10, label %20, label %11, !dbg !61

11:                                               ; preds = %0
  %12 = load i32, i32* @cmd, align 4, !dbg !62, !tbaa !10
  %13 = icmp eq i32 %12, 3, !dbg !63
  br i1 %13, label %20, label %14, !dbg !64

14:                                               ; preds = %11
  %15 = load i32, i32* @cmd, align 4, !dbg !65, !tbaa !10
  %16 = icmp eq i32 %15, 4, !dbg !66
  br i1 %16, label %20, label %17, !dbg !67

17:                                               ; preds = %14
  %18 = load i32, i32* @cmd, align 4, !dbg !68, !tbaa !10
  %19 = icmp eq i32 %18, 1, !dbg !69
  br i1 %19, label %20, label %21, !dbg !59

20:                                               ; preds = %17, %14, %11, %0
  store i32 1, i32* @decodingStatus, align 4, !dbg !70, !tbaa !10
  br label %21, !dbg !71

21:                                               ; preds = %20, %17
  %22 = load i32, i32* @rspStatus, align 4, !dbg !72, !tbaa !10
  %23 = icmp eq i32 %22, 1, !dbg !73
  br i1 %23, label %24, label %60, !dbg !72

24:                                               ; preds = %21
  %25 = load i32, i32* @cmd, align 4, !dbg !74, !tbaa !10
  %26 = icmp eq i32 %25, 2, !dbg !75
  br i1 %26, label %27, label %33, !dbg !74

27:                                               ; preds = %24
  %28 = load i32, i32* @systemState, align 4, !dbg !76, !tbaa !10
  %29 = icmp ne i32 %28, 1, !dbg !77
  br i1 %29, label %30, label %31, !dbg !76

30:                                               ; preds = %27
  store i32 0, i32* @rspStatus, align 4, !dbg !78, !tbaa !10
  br label %32, !dbg !79

31:                                               ; preds = %27
  store i32 0, i32* @systemState, align 4, !dbg !80, !tbaa !10
  br label %32

32:                                               ; preds = %31, %30
  store i32 1, i32* @sendit, align 4, !dbg !81, !tbaa !10
  br label %33, !dbg !82

33:                                               ; preds = %32, %24
  %34 = load i32, i32* @cmd, align 4, !dbg !83, !tbaa !10
  %35 = icmp eq i32 %34, 3, !dbg !84
  br i1 %35, label %36, label %37, !dbg !83

36:                                               ; preds = %33
  store i32 1, i32* @sendit, align 4, !dbg !85, !tbaa !10
  br label %37, !dbg !86

37:                                               ; preds = %36, %33
  %38 = load i32, i32* @cmd, align 4, !dbg !87, !tbaa !10
  %39 = icmp eq i32 %38, 4, !dbg !88
  br i1 %39, label %40, label %41, !dbg !87

40:                                               ; preds = %37
  store i32 1, i32* @sendit, align 4, !dbg !89, !tbaa !10
  br label %41, !dbg !90

41:                                               ; preds = %40, %37
  %42 = load i32, i32* @cmd, align 4, !dbg !91, !tbaa !10
  %43 = icmp eq i32 %42, 0, !dbg !92
  br i1 %43, label %44, label %59, !dbg !91

44:                                               ; preds = %41
  %45 = load i32, i32* @systemState, align 4, !dbg !93, !tbaa !10
  %46 = icmp ne i32 %45, 0, !dbg !94
  br i1 %46, label %47, label %48, !dbg !93

47:                                               ; preds = %44
  store i32 0, i32* @rspStatus, align 4, !dbg !95, !tbaa !10
  br label %58, !dbg !96

48:                                               ; preds = %44
  %49 = load i32, i32* @numberOfRecords, align 4, !dbg !97, !tbaa !10
  %50 = add nsw i32 %49, 1, !dbg !98
  %51 = icmp sge i32 %50, 64, !dbg !99
  br i1 %51, label %52, label %53, !dbg !100

52:                                               ; preds = %48
  store i32 0, i32* @systemState, align 4, !dbg !101, !tbaa !10
  br label %53, !dbg !102

53:                                               ; preds = %52, %48
  store i32 0, i32* @intervalCounter, align 4, !dbg !103, !tbaa !10
  store i32 0, i32* @tickCounter, align 4, !dbg !104, !tbaa !10
  store i32 0, i32* @numberOfRecords, align 4, !dbg !105, !tbaa !10
  store i32 1, i32* @startTime, align 4, !dbg !106, !tbaa !10
  store i32 1, i32* @interval, align 4, !dbg !107, !tbaa !10
  store i32 1, i32* @systemState, align 4, !dbg !108, !tbaa !10
  %54 = load i32, i32* @numberOfRecords, align 4, !dbg !109, !tbaa !10
  %55 = icmp ne i32 %54, 0, !dbg !110
  br i1 %55, label %56, label %57, !dbg !109

56:                                               ; preds = %53
  br label %57, !dbg !111

57:                                               ; preds = %56, %53
  store i32 1, i32* @sendit, align 4, !dbg !112, !tbaa !10
  br label %58

58:                                               ; preds = %57, %47
  br label %59, !dbg !113

59:                                               ; preds = %58, %41
  br label %60, !dbg !114

60:                                               ; preds = %59, %21
  ret void, !dbg !115
}

; Function Attrs: nounwind
declare i32 @rand() #0

; Function Attrs: nounwind uwtable
define i32 @svp_simple_014_001_main() #2 !dbg !116 {
  store i32 0, i32* @systemState, align 4, !dbg !117, !tbaa !10
  ret i32 0, !dbg !118
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/logger/logger2.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/logger")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "stop", scope: !1, file: !1, line: 55, type: !8, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !2)
!9 = !DILocation(line: 58, column: 17, scope: !7)
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 59, column: 1, scope: !7)
!15 = distinct !DISubprogram(name: "start", scope: !1, file: !1, line: 61, type: !8, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!16 = !DILocation(line: 63, column: 9, scope: !15)
!17 = !DILocation(line: 63, column: 24, scope: !15)
!18 = !DILocation(line: 63, column: 27, scope: !15)
!19 = !DILocation(line: 65, column: 21, scope: !15)
!20 = !DILocation(line: 66, column: 5, scope: !15)
!21 = !DILocation(line: 67, column: 21, scope: !15)
!22 = !DILocation(line: 68, column: 17, scope: !15)
!23 = !DILocation(line: 69, column: 21, scope: !15)
!24 = !DILocation(line: 70, column: 15, scope: !15)
!25 = !DILocation(line: 71, column: 14, scope: !15)
!26 = !DILocation(line: 72, column: 17, scope: !15)
!27 = !DILocation(line: 75, column: 1, scope: !15)
!28 = distinct !DISubprogram(name: "task_isr_1", scope: !1, file: !1, line: 78, type: !8, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = !DILocation(line: 82, column: 13, scope: !28)
!30 = !DILocation(line: 83, column: 20, scope: !28)
!31 = !DILocation(line: 84, column: 31, scope: !28)
!32 = !DILocation(line: 85, column: 28, scope: !28)
!33 = !DILocation(line: 88, column: 21, scope: !28)
!34 = !DILocation(line: 91, column: 13, scope: !28)
!35 = !DILocation(line: 91, column: 25, scope: !28)
!36 = !DILocation(line: 93, column: 9, scope: !28)
!37 = !DILocation(line: 94, column: 24, scope: !28)
!38 = !DILocation(line: 96, column: 17, scope: !28)
!39 = !DILocation(line: 97, column: 24, scope: !28)
!40 = !DILocation(line: 99, column: 1, scope: !28)
!41 = distinct !DISubprogram(name: "task_isr_2", scope: !1, file: !1, line: 102, type: !8, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 106, column: 13, scope: !41)
!43 = !DILocation(line: 107, column: 21, scope: !41)
!44 = !DILocation(line: 110, column: 13, scope: !41)
!45 = !DILocation(line: 110, column: 25, scope: !41)
!46 = !DILocation(line: 112, column: 9, scope: !41)
!47 = !DILocation(line: 115, column: 1, scope: !41)
!48 = distinct !DISubprogram(name: "task_isr_3", scope: !1, file: !1, line: 118, type: !8, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 120, column: 13, scope: !48)
!50 = !DILocation(line: 126, column: 15, scope: !48)
!51 = !DILocation(line: 126, column: 22, scope: !48)
!52 = !DILocation(line: 126, column: 25, scope: !48)
!53 = !DILocation(line: 126, column: 13, scope: !48)
!54 = !DILocation(line: 127, column: 21, scope: !48)
!55 = !DILocation(line: 127, column: 28, scope: !48)
!56 = !DILocation(line: 127, column: 31, scope: !48)
!57 = !DILocation(line: 127, column: 19, scope: !48)
!58 = !DILocation(line: 128, column: 24, scope: !48)
!59 = !DILocation(line: 130, column: 12, scope: !48)
!60 = !DILocation(line: 130, column: 15, scope: !48)
!61 = !DILocation(line: 130, column: 19, scope: !48)
!62 = !DILocation(line: 130, column: 22, scope: !48)
!63 = !DILocation(line: 130, column: 25, scope: !48)
!64 = !DILocation(line: 130, column: 29, scope: !48)
!65 = !DILocation(line: 131, column: 17, scope: !48)
!66 = !DILocation(line: 131, column: 20, scope: !48)
!67 = !DILocation(line: 131, column: 24, scope: !48)
!68 = !DILocation(line: 131, column: 27, scope: !48)
!69 = !DILocation(line: 131, column: 30, scope: !48)
!70 = !DILocation(line: 132, column: 28, scope: !48)
!71 = !DILocation(line: 133, column: 9, scope: !48)
!72 = !DILocation(line: 135, column: 13, scope: !48)
!73 = !DILocation(line: 135, column: 23, scope: !48)
!74 = !DILocation(line: 136, column: 17, scope: !48)
!75 = !DILocation(line: 136, column: 21, scope: !48)
!76 = !DILocation(line: 137, column: 21, scope: !48)
!77 = !DILocation(line: 137, column: 33, scope: !48)
!78 = !DILocation(line: 138, column: 31, scope: !48)
!79 = !DILocation(line: 139, column: 17, scope: !48)
!80 = !DILocation(line: 141, column: 33, scope: !48)
!81 = !DILocation(line: 144, column: 24, scope: !48)
!82 = !DILocation(line: 145, column: 13, scope: !48)
!83 = !DILocation(line: 146, column: 17, scope: !48)
!84 = !DILocation(line: 146, column: 21, scope: !48)
!85 = !DILocation(line: 148, column: 23, scope: !48)
!86 = !DILocation(line: 149, column: 13, scope: !48)
!87 = !DILocation(line: 150, column: 17, scope: !48)
!88 = !DILocation(line: 150, column: 21, scope: !48)
!89 = !DILocation(line: 152, column: 23, scope: !48)
!90 = !DILocation(line: 153, column: 13, scope: !48)
!91 = !DILocation(line: 154, column: 17, scope: !48)
!92 = !DILocation(line: 154, column: 21, scope: !48)
!93 = !DILocation(line: 155, column: 21, scope: !48)
!94 = !DILocation(line: 155, column: 33, scope: !48)
!95 = !DILocation(line: 156, column: 31, scope: !48)
!96 = !DILocation(line: 157, column: 17, scope: !48)
!97 = !DILocation(line: 158, column: 35, scope: !48)
!98 = !DILocation(line: 158, column: 51, scope: !48)
!99 = !DILocation(line: 159, column: 33, scope: !48)
!100 = !DILocation(line: 159, column: 25, scope: !48)
!101 = !DILocation(line: 160, column: 37, scope: !48)
!102 = !DILocation(line: 161, column: 21, scope: !48)
!103 = !DILocation(line: 162, column: 37, scope: !48)
!104 = !DILocation(line: 163, column: 33, scope: !48)
!105 = !DILocation(line: 164, column: 37, scope: !48)
!106 = !DILocation(line: 165, column: 31, scope: !48)
!107 = !DILocation(line: 166, column: 30, scope: !48)
!108 = !DILocation(line: 167, column: 33, scope: !48)
!109 = !DILocation(line: 169, column: 25, scope: !48)
!110 = !DILocation(line: 169, column: 41, scope: !48)
!111 = !DILocation(line: 171, column: 21, scope: !48)
!112 = !DILocation(line: 174, column: 28, scope: !48)
!113 = !DILocation(line: 177, column: 13, scope: !48)
!114 = !DILocation(line: 178, column: 9, scope: !48)
!115 = !DILocation(line: 180, column: 1, scope: !48)
!116 = distinct !DISubprogram(name: "svp_simple_014_001_main", scope: !1, file: !1, line: 184, type: !8, scopeLine: 184, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!117 = !DILocation(line: 185, column: 17, scope: !116)
!118 = !DILocation(line: 195, column: 5, scope: !116)
