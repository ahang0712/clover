; ModuleID = 'svp_simple_029_001.bc'
source_filename = "./svp_simple_029_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_029_001_ptr_SetSelfCtrlFlag = common global void (i32, i8, i8)* null, align 8
@svp_simple_029_001_tm_blocks = common global [4096 x i8] zeroinitializer, align 16
@svp_simple_029_001_average_adjust_flag = common global i8 0, align 1
@svp_simple_029_001_ptr_SetTmData = common global void (i32, i8)* null, align 8
@svp_simple_029_001_ptr_GetTmData = common global i8 (i32)* null, align 8
@svp_simple_029_001_average_adjust_count = common global i8 0, align 1

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_main() #0 !dbg !7 {
  %1 = alloca i8, align 1
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %1) #3, !dbg !10
  store i8 1, i8* %1, align 1, !dbg !11, !tbaa !12
  call void @svp_simple_029_001_init(), !dbg !15
  call void @svp_simple_029_001_TmOrgFuncMap(), !dbg !16
  %2 = load i8, i8* %1, align 1, !dbg !17, !tbaa !12
  %3 = zext i8 %2 to i32, !dbg !17
  %4 = icmp eq i32 %3, 1, !dbg !18
  br i1 %4, label %5, label %7, !dbg !17

5:                                                ; preds = %0
  %6 = load void (i32, i8, i8)*, void (i32, i8, i8)** @svp_simple_029_001_ptr_SetSelfCtrlFlag, align 8, !dbg !19, !tbaa !20
  call void %6(i32 36, i8 zeroext -1, i8 zeroext 0), !dbg !19
  br label %7, !dbg !22

7:                                                ; preds = %5, %0
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %1) #3, !dbg !23
  ret void, !dbg !23
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_init() #0 !dbg !24 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !25
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !25
  store i32 0, i32* %1, align 4, !dbg !26, !tbaa !27
  br label %3, !dbg !25

3:                                                ; preds = %14, %0
  %4 = load i32, i32* %1, align 4, !dbg !29, !tbaa !27
  %5 = icmp slt i32 %4, 4096, !dbg !30
  br i1 %5, label %8, label %6, !dbg !31

6:                                                ; preds = %3
  %7 = bitcast i32* %1 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #3, !dbg !31
  br label %17

8:                                                ; preds = %3
  %9 = call i32 (...) @rand(), !dbg !32
  %10 = trunc i32 %9 to i8, !dbg !32
  %11 = load i32, i32* %1, align 4, !dbg !33, !tbaa !27
  %12 = sext i32 %11 to i64, !dbg !34
  %13 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %12, !dbg !34
  store volatile i8 %10, i8* %13, align 1, !dbg !35, !tbaa !12
  br label %14, !dbg !36

14:                                               ; preds = %8
  %15 = load i32, i32* %1, align 4, !dbg !37, !tbaa !27
  %16 = add nsw i32 %15, 1, !dbg !37
  store i32 %16, i32* %1, align 4, !dbg !37, !tbaa !27
  br label %3, !dbg !31, !llvm.loop !38

17:                                               ; preds = %6
  store volatile i8 -1, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !39, !tbaa !12
  call void (...) @init(), !dbg !40
  ret void, !dbg !41
}

declare i32 @rand(...) #2

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_TmOrgFuncMap() #0 !dbg !42 {
  store void (i32, i8)* @svp_simple_029_001_SetTmData, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !43, !tbaa !20
  store i8 (i32)* @svp_simple_029_001_GetTmData, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !44, !tbaa !20
  store void (i32, i8, i8)* @svp_simple_029_001_SetSelfCtrlFlag, void (i32, i8, i8)** @svp_simple_029_001_ptr_SetSelfCtrlFlag, align 8, !dbg !45, !tbaa !20
  ret void, !dbg !46
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_SetTmData(i32 %0, i8 zeroext %1) #0 !dbg !47 {
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  store i32 %0, i32* %3, align 4, !tbaa !27
  store i8 %1, i8* %4, align 1, !tbaa !12
  %5 = load i8, i8* %4, align 1, !dbg !48, !tbaa !12
  %6 = load i32, i32* %3, align 4, !dbg !49, !tbaa !27
  %7 = zext i32 %6 to i64, !dbg !50
  %8 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %7, !dbg !50
  store volatile i8 %5, i8* %8, align 1, !dbg !51, !tbaa !12
  ret void, !dbg !52
}

; Function Attrs: nounwind uwtable
define zeroext i8 @svp_simple_029_001_GetTmData(i32 %0) #0 !dbg !53 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !27
  %3 = load i32, i32* %2, align 4, !dbg !54, !tbaa !27
  %4 = zext i32 %3 to i64, !dbg !55
  %5 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %4, !dbg !55
  %6 = load volatile i8, i8* %5, align 1, !dbg !55, !tbaa !12
  ret i8 %6, !dbg !56
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_SetSelfCtrlFlag(i32 %0, i8 zeroext %1, i8 zeroext %2) #0 !dbg !57 {
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  store i32 %0, i32* %4, align 4, !tbaa !27
  store i8 %1, i8* %5, align 1, !tbaa !12
  store i8 %2, i8* %6, align 1, !tbaa !12
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %7) #3, !dbg !58
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %8) #3, !dbg !59
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #3, !dbg !60
  %10 = load i8, i8* %5, align 1, !dbg !61, !tbaa !12
  %11 = zext i8 %10 to i32, !dbg !61
  %12 = icmp sgt i32 %11, 128, !dbg !62
  br i1 %12, label %13, label %14, !dbg !61

13:                                               ; preds = %3
  store i8 1, i8* %7, align 1, !dbg !63, !tbaa !12
  br label %15, !dbg !64

14:                                               ; preds = %3
  store i8 0, i8* %7, align 1, !dbg !65, !tbaa !12
  br label %15

15:                                               ; preds = %14, %13
  %16 = load i8, i8* %6, align 1, !dbg !66, !tbaa !12
  %17 = zext i8 %16 to i32, !dbg !66
  %18 = load i8, i8* %7, align 1, !dbg !67, !tbaa !12
  %19 = zext i8 %18 to i32, !dbg !67
  %20 = shl i32 %19, %17, !dbg !67
  %21 = trunc i32 %20 to i8, !dbg !67
  store i8 %21, i8* %7, align 1, !dbg !67, !tbaa !12
  store i8 1, i8* %8, align 1, !dbg !68, !tbaa !12
  %22 = load i8, i8* %8, align 1, !dbg !69, !tbaa !12
  %23 = zext i8 %22 to i32, !dbg !69
  %24 = xor i32 %23, -1, !dbg !70
  %25 = load i8, i8* %8, align 1, !dbg !71, !tbaa !12
  %26 = zext i8 %25 to i32, !dbg !71
  %27 = shl i32 %26, %24, !dbg !71
  %28 = trunc i32 %27 to i8, !dbg !71
  store i8 %28, i8* %8, align 1, !dbg !71, !tbaa !12
  %29 = load i8 (i32)*, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !72, !tbaa !20
  %30 = load i32, i32* %4, align 4, !dbg !73, !tbaa !27
  %31 = call zeroext i8 %29(i32 %30), !dbg !72
  store i8 %31, i8* %9, align 1, !dbg !74, !tbaa !12
  %32 = load i8 (i32)*, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !75, !tbaa !20
  %33 = load i32, i32* %4, align 4, !dbg !76, !tbaa !27
  %34 = add i32 %33, 1, !dbg !77
  %35 = call zeroext i8 %32(i32 %34), !dbg !75
  %36 = zext i8 %35 to i32, !dbg !75
  %37 = load i8, i8* %9, align 1, !dbg !78, !tbaa !12
  %38 = zext i8 %37 to i32, !dbg !78
  %39 = add nsw i32 %38, %36, !dbg !78
  %40 = trunc i32 %39 to i8, !dbg !78
  store i8 %40, i8* %9, align 1, !dbg !78, !tbaa !12
  %41 = load i8, i8* %7, align 1, !dbg !79, !tbaa !12
  %42 = zext i8 %41 to i32, !dbg !79
  %43 = load i8, i8* %9, align 1, !dbg !80, !tbaa !12
  %44 = zext i8 %43 to i32, !dbg !80
  %45 = or i32 %44, %42, !dbg !80
  %46 = trunc i32 %45 to i8, !dbg !80
  store i8 %46, i8* %9, align 1, !dbg !80, !tbaa !12
  %47 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !81, !tbaa !20
  %48 = load i32, i32* %4, align 4, !dbg !82, !tbaa !27
  %49 = load i8, i8* %9, align 1, !dbg !83, !tbaa !12
  call void %47(i32 %48, i8 zeroext %49), !dbg !81
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #3, !dbg !84
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %8) #3, !dbg !84
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %7) #3, !dbg !84
  ret void, !dbg !84
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_isr_1() #0 !dbg !85 {
  %1 = load volatile i8, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !86, !tbaa !12
  %2 = zext i8 %1 to i32, !dbg !86
  %3 = icmp eq i32 %2, 255, !dbg !87
  br i1 %3, label %4, label %9, !dbg !86

4:                                                ; preds = %0
  %5 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !88, !tbaa !12
  %6 = add i8 %5, 1, !dbg !88
  store volatile i8 %6, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !88, !tbaa !12
  %7 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !89, !tbaa !20
  %8 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !90, !tbaa !12
  call void %7(i32 36, i8 zeroext %8), !dbg !89
  br label %12, !dbg !91

9:                                                ; preds = %0
  store volatile i8 0, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !92, !tbaa !12
  %10 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !93, !tbaa !20
  %11 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !94, !tbaa !12
  call void %10(i32 36, i8 zeroext %11), !dbg !93
  br label %12

12:                                               ; preds = %9, %4
  ret void, !dbg !95
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_029_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_029")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_029_001_main", scope: !8, file: !8, line: 34, type: !9, scopeLine: 34, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_029_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_029")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 35, column: 3, scope: !7)
!11 = !DILocation(line: 35, column: 13, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !DILocation(line: 36, column: 3, scope: !7)
!16 = !DILocation(line: 37, column: 3, scope: !7)
!17 = !DILocation(line: 39, column: 7, scope: !7)
!18 = !DILocation(line: 39, column: 39, scope: !7)
!19 = !DILocation(line: 40, column: 5, scope: !7)
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !13, i64 0}
!22 = !DILocation(line: 41, column: 3, scope: !7)
!23 = !DILocation(line: 42, column: 1, scope: !7)
!24 = distinct !DISubprogram(name: "svp_simple_029_001_init", scope: !8, file: !8, line: 43, type: !9, scopeLine: 43, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 44, column: 8, scope: !24)
!26 = !DILocation(line: 44, column: 12, scope: !24)
!27 = !{!28, !28, i64 0}
!28 = !{!"int", !13, i64 0}
!29 = !DILocation(line: 44, column: 19, scope: !24)
!30 = !DILocation(line: 44, column: 21, scope: !24)
!31 = !DILocation(line: 44, column: 3, scope: !24)
!32 = !DILocation(line: 45, column: 39, scope: !24)
!33 = !DILocation(line: 45, column: 34, scope: !24)
!34 = !DILocation(line: 45, column: 5, scope: !24)
!35 = !DILocation(line: 45, column: 37, scope: !24)
!36 = !DILocation(line: 46, column: 3, scope: !24)
!37 = !DILocation(line: 44, column: 30, scope: !24)
!38 = distinct !{!38, !31, !36}
!39 = !DILocation(line: 47, column: 42, scope: !24)
!40 = !DILocation(line: 49, column: 3, scope: !24)
!41 = !DILocation(line: 50, column: 1, scope: !24)
!42 = distinct !DISubprogram(name: "svp_simple_029_001_TmOrgFuncMap", scope: !8, file: !8, line: 52, type: !9, scopeLine: 52, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 53, column: 36, scope: !42)
!44 = !DILocation(line: 54, column: 36, scope: !42)
!45 = !DILocation(line: 55, column: 42, scope: !42)
!46 = !DILocation(line: 56, column: 1, scope: !42)
!47 = distinct !DISubprogram(name: "svp_simple_029_001_SetTmData", scope: !8, file: !8, line: 82, type: !9, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 83, column: 43, scope: !47)
!49 = !DILocation(line: 83, column: 32, scope: !47)
!50 = !DILocation(line: 83, column: 3, scope: !47)
!51 = !DILocation(line: 83, column: 41, scope: !47)
!52 = !DILocation(line: 84, column: 1, scope: !47)
!53 = distinct !DISubprogram(name: "svp_simple_029_001_GetTmData", scope: !8, file: !8, line: 79, type: !9, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 80, column: 39, scope: !53)
!55 = !DILocation(line: 80, column: 10, scope: !53)
!56 = !DILocation(line: 80, column: 3, scope: !53)
!57 = distinct !DISubprogram(name: "svp_simple_029_001_SetSelfCtrlFlag", scope: !8, file: !8, line: 57, type: !9, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 59, column: 3, scope: !57)
!59 = !DILocation(line: 60, column: 3, scope: !57)
!60 = !DILocation(line: 61, column: 3, scope: !57)
!61 = !DILocation(line: 63, column: 7, scope: !57)
!62 = !DILocation(line: 63, column: 17, scope: !57)
!63 = !DILocation(line: 64, column: 10, scope: !57)
!64 = !DILocation(line: 65, column: 3, scope: !57)
!65 = !DILocation(line: 66, column: 10, scope: !57)
!66 = !DILocation(line: 69, column: 12, scope: !57)
!67 = !DILocation(line: 69, column: 8, scope: !57)
!68 = !DILocation(line: 70, column: 8, scope: !57)
!69 = !DILocation(line: 71, column: 13, scope: !57)
!70 = !DILocation(line: 71, column: 12, scope: !57)
!71 = !DILocation(line: 71, column: 8, scope: !57)
!72 = !DILocation(line: 73, column: 14, scope: !57)
!73 = !DILocation(line: 73, column: 47, scope: !57)
!74 = !DILocation(line: 73, column: 12, scope: !57)
!75 = !DILocation(line: 74, column: 15, scope: !57)
!76 = !DILocation(line: 74, column: 48, scope: !57)
!77 = !DILocation(line: 74, column: 56, scope: !57)
!78 = !DILocation(line: 74, column: 12, scope: !57)
!79 = !DILocation(line: 75, column: 15, scope: !57)
!80 = !DILocation(line: 75, column: 12, scope: !57)
!81 = !DILocation(line: 77, column: 3, scope: !57)
!82 = !DILocation(line: 77, column: 36, scope: !57)
!83 = !DILocation(line: 77, column: 45, scope: !57)
!84 = !DILocation(line: 78, column: 1, scope: !57)
!85 = distinct !DISubprogram(name: "svp_simple_029_001_isr_1", scope: !8, file: !8, line: 86, type: !9, scopeLine: 86, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 87, column: 7, scope: !85)
!87 = !DILocation(line: 87, column: 46, scope: !85)
!88 = !DILocation(line: 88, column: 44, scope: !85)
!89 = !DILocation(line: 89, column: 5, scope: !85)
!90 = !DILocation(line: 90, column: 13, scope: !85)
!91 = !DILocation(line: 91, column: 3, scope: !85)
!92 = !DILocation(line: 92, column: 45, scope: !85)
!93 = !DILocation(line: 93, column: 5, scope: !85)
!94 = !DILocation(line: 93, column: 42, scope: !85)
!95 = !DILocation(line: 95, column: 1, scope: !85)
