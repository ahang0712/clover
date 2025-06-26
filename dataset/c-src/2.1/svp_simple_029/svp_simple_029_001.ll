; ModuleID = 'svp_simple_029_001.bc'
source_filename = "./svp_simple_029_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_029_001_ptr_SetSelfCtrlFlag = common global void (i32, i8, i8)* null, align 8
@svp_simple_029_001_average_adjust_flag = common global i8 0, align 1
@svp_simple_029_001_ptr_SetTmData = common global void (i32, i8)* null, align 8
@svp_simple_029_001_ptr_GetTmData = common global i8 (i32)* null, align 8
@svp_simple_029_001_tm_blocks = common global [4096 x i8] zeroinitializer, align 16
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

3:                                                ; preds = %9, %0
  %4 = load i32, i32* %1, align 4, !dbg !29, !tbaa !27
  %5 = icmp slt i32 %4, 4096, !dbg !30
  br i1 %5, label %8, label %6, !dbg !31

6:                                                ; preds = %3
  %7 = bitcast i32* %1 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #3, !dbg !31
  br label %12

8:                                                ; preds = %3
  br label %9, !dbg !32

9:                                                ; preds = %8
  %10 = load i32, i32* %1, align 4, !dbg !33, !tbaa !27
  %11 = add nsw i32 %10, 1, !dbg !33
  store i32 %11, i32* %1, align 4, !dbg !33, !tbaa !27
  br label %3, !dbg !31, !llvm.loop !34

12:                                               ; preds = %6
  store volatile i8 -1, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !35, !tbaa !12
  call void (...) @init(), !dbg !36
  ret void, !dbg !37
}

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_TmOrgFuncMap() #0 !dbg !38 {
  store void (i32, i8)* @svp_simple_029_001_SetTmData, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !39, !tbaa !20
  store i8 (i32)* @svp_simple_029_001_GetTmData, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !40, !tbaa !20
  store void (i32, i8, i8)* @svp_simple_029_001_SetSelfCtrlFlag, void (i32, i8, i8)** @svp_simple_029_001_ptr_SetSelfCtrlFlag, align 8, !dbg !41, !tbaa !20
  ret void, !dbg !42
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_SetTmData(i32 %0, i8 zeroext %1) #0 !dbg !43 {
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  store i32 %0, i32* %3, align 4, !tbaa !27
  store i8 %1, i8* %4, align 1, !tbaa !12
  %5 = load i8, i8* %4, align 1, !dbg !44, !tbaa !12
  %6 = load i32, i32* %3, align 4, !dbg !45, !tbaa !27
  %7 = zext i32 %6 to i64, !dbg !46
  %8 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %7, !dbg !46
  store volatile i8 %5, i8* %8, align 1, !dbg !47, !tbaa !12
  ret void, !dbg !48
}

; Function Attrs: nounwind uwtable
define zeroext i8 @svp_simple_029_001_GetTmData(i32 %0) #0 !dbg !49 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !27
  %3 = load i32, i32* %2, align 4, !dbg !50, !tbaa !27
  %4 = zext i32 %3 to i64, !dbg !51
  %5 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %4, !dbg !51
  %6 = load volatile i8, i8* %5, align 1, !dbg !51, !tbaa !12
  ret i8 %6, !dbg !52
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_SetSelfCtrlFlag(i32 %0, i8 zeroext %1, i8 zeroext %2) #0 !dbg !53 {
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  store i32 %0, i32* %4, align 4, !tbaa !27
  store i8 %1, i8* %5, align 1, !tbaa !12
  store i8 %2, i8* %6, align 1, !tbaa !12
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %7) #3, !dbg !54
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %8) #3, !dbg !55
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %9) #3, !dbg !56
  %10 = load i8, i8* %5, align 1, !dbg !57, !tbaa !12
  %11 = zext i8 %10 to i32, !dbg !57
  %12 = icmp sgt i32 %11, 128, !dbg !58
  br i1 %12, label %13, label %14, !dbg !57

13:                                               ; preds = %3
  store i8 1, i8* %7, align 1, !dbg !59, !tbaa !12
  br label %15, !dbg !60

14:                                               ; preds = %3
  store i8 0, i8* %7, align 1, !dbg !61, !tbaa !12
  br label %15

15:                                               ; preds = %14, %13
  %16 = load i8, i8* %6, align 1, !dbg !62, !tbaa !12
  %17 = zext i8 %16 to i32, !dbg !62
  %18 = load i8, i8* %7, align 1, !dbg !63, !tbaa !12
  %19 = zext i8 %18 to i32, !dbg !63
  %20 = shl i32 %19, %17, !dbg !63
  %21 = trunc i32 %20 to i8, !dbg !63
  store i8 %21, i8* %7, align 1, !dbg !63, !tbaa !12
  store i8 1, i8* %8, align 1, !dbg !64, !tbaa !12
  %22 = load i8, i8* %8, align 1, !dbg !65, !tbaa !12
  %23 = zext i8 %22 to i32, !dbg !65
  %24 = xor i32 %23, -1, !dbg !66
  %25 = load i8, i8* %8, align 1, !dbg !67, !tbaa !12
  %26 = zext i8 %25 to i32, !dbg !67
  %27 = shl i32 %26, %24, !dbg !67
  %28 = trunc i32 %27 to i8, !dbg !67
  store i8 %28, i8* %8, align 1, !dbg !67, !tbaa !12
  %29 = load i8 (i32)*, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !68, !tbaa !20
  %30 = load i32, i32* %4, align 4, !dbg !69, !tbaa !27
  %31 = call zeroext i8 %29(i32 %30), !dbg !68
  store i8 %31, i8* %9, align 1, !dbg !70, !tbaa !12
  %32 = load i8 (i32)*, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !71, !tbaa !20
  %33 = load i32, i32* %4, align 4, !dbg !72, !tbaa !27
  %34 = add i32 %33, 1, !dbg !73
  %35 = call zeroext i8 %32(i32 %34), !dbg !71
  %36 = zext i8 %35 to i32, !dbg !71
  %37 = load i8, i8* %9, align 1, !dbg !74, !tbaa !12
  %38 = zext i8 %37 to i32, !dbg !74
  %39 = add nsw i32 %38, %36, !dbg !74
  %40 = trunc i32 %39 to i8, !dbg !74
  store i8 %40, i8* %9, align 1, !dbg !74, !tbaa !12
  %41 = load i8, i8* %7, align 1, !dbg !75, !tbaa !12
  %42 = zext i8 %41 to i32, !dbg !75
  %43 = load i8, i8* %9, align 1, !dbg !76, !tbaa !12
  %44 = zext i8 %43 to i32, !dbg !76
  %45 = or i32 %44, %42, !dbg !76
  %46 = trunc i32 %45 to i8, !dbg !76
  store i8 %46, i8* %9, align 1, !dbg !76, !tbaa !12
  %47 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !77, !tbaa !20
  %48 = load i32, i32* %4, align 4, !dbg !78, !tbaa !27
  %49 = load i8, i8* %9, align 1, !dbg !79, !tbaa !12
  call void %47(i32 %48, i8 zeroext %49), !dbg !77
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %9) #3, !dbg !80
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %8) #3, !dbg !80
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %7) #3, !dbg !80
  ret void, !dbg !80
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_isr_1() #0 !dbg !81 {
  %1 = load volatile i8, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !82, !tbaa !12
  %2 = zext i8 %1 to i32, !dbg !82
  %3 = icmp eq i32 %2, 255, !dbg !83
  br i1 %3, label %4, label %9, !dbg !82

4:                                                ; preds = %0
  %5 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !84, !tbaa !12
  %6 = add i8 %5, 1, !dbg !84
  store volatile i8 %6, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !84, !tbaa !12
  %7 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !85, !tbaa !20
  %8 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !86, !tbaa !12
  call void %7(i32 36, i8 zeroext %8), !dbg !85
  br label %12, !dbg !87

9:                                                ; preds = %0
  store volatile i8 0, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !88, !tbaa !12
  %10 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !89, !tbaa !20
  %11 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !90, !tbaa !12
  call void %10(i32 36, i8 zeroext %11), !dbg !89
  br label %12

12:                                               ; preds = %9, %4
  ret void, !dbg !91
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_029_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_029")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_029_001_main", scope: !8, file: !8, line: 19, type: !9, scopeLine: 19, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_029_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_029")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 20, column: 3, scope: !7)
!11 = !DILocation(line: 20, column: 13, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !DILocation(line: 21, column: 3, scope: !7)
!16 = !DILocation(line: 22, column: 3, scope: !7)
!17 = !DILocation(line: 24, column: 7, scope: !7)
!18 = !DILocation(line: 24, column: 39, scope: !7)
!19 = !DILocation(line: 25, column: 5, scope: !7)
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !13, i64 0}
!22 = !DILocation(line: 26, column: 3, scope: !7)
!23 = !DILocation(line: 27, column: 1, scope: !7)
!24 = distinct !DISubprogram(name: "svp_simple_029_001_init", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 29, column: 8, scope: !24)
!26 = !DILocation(line: 29, column: 12, scope: !24)
!27 = !{!28, !28, i64 0}
!28 = !{!"int", !13, i64 0}
!29 = !DILocation(line: 29, column: 19, scope: !24)
!30 = !DILocation(line: 29, column: 21, scope: !24)
!31 = !DILocation(line: 29, column: 3, scope: !24)
!32 = !DILocation(line: 31, column: 3, scope: !24)
!33 = !DILocation(line: 29, column: 30, scope: !24)
!34 = distinct !{!34, !31, !32}
!35 = !DILocation(line: 32, column: 42, scope: !24)
!36 = !DILocation(line: 34, column: 3, scope: !24)
!37 = !DILocation(line: 35, column: 1, scope: !24)
!38 = distinct !DISubprogram(name: "svp_simple_029_001_TmOrgFuncMap", scope: !8, file: !8, line: 37, type: !9, scopeLine: 37, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 38, column: 36, scope: !38)
!40 = !DILocation(line: 39, column: 36, scope: !38)
!41 = !DILocation(line: 40, column: 42, scope: !38)
!42 = !DILocation(line: 41, column: 1, scope: !38)
!43 = distinct !DISubprogram(name: "svp_simple_029_001_SetTmData", scope: !8, file: !8, line: 67, type: !9, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 68, column: 43, scope: !43)
!45 = !DILocation(line: 68, column: 32, scope: !43)
!46 = !DILocation(line: 68, column: 3, scope: !43)
!47 = !DILocation(line: 68, column: 41, scope: !43)
!48 = !DILocation(line: 69, column: 1, scope: !43)
!49 = distinct !DISubprogram(name: "svp_simple_029_001_GetTmData", scope: !8, file: !8, line: 64, type: !9, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 65, column: 39, scope: !49)
!51 = !DILocation(line: 65, column: 10, scope: !49)
!52 = !DILocation(line: 65, column: 3, scope: !49)
!53 = distinct !DISubprogram(name: "svp_simple_029_001_SetSelfCtrlFlag", scope: !8, file: !8, line: 42, type: !9, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 44, column: 3, scope: !53)
!55 = !DILocation(line: 45, column: 3, scope: !53)
!56 = !DILocation(line: 46, column: 3, scope: !53)
!57 = !DILocation(line: 48, column: 7, scope: !53)
!58 = !DILocation(line: 48, column: 17, scope: !53)
!59 = !DILocation(line: 49, column: 10, scope: !53)
!60 = !DILocation(line: 50, column: 3, scope: !53)
!61 = !DILocation(line: 51, column: 10, scope: !53)
!62 = !DILocation(line: 54, column: 12, scope: !53)
!63 = !DILocation(line: 54, column: 8, scope: !53)
!64 = !DILocation(line: 55, column: 8, scope: !53)
!65 = !DILocation(line: 56, column: 13, scope: !53)
!66 = !DILocation(line: 56, column: 12, scope: !53)
!67 = !DILocation(line: 56, column: 8, scope: !53)
!68 = !DILocation(line: 58, column: 14, scope: !53)
!69 = !DILocation(line: 58, column: 47, scope: !53)
!70 = !DILocation(line: 58, column: 12, scope: !53)
!71 = !DILocation(line: 59, column: 15, scope: !53)
!72 = !DILocation(line: 59, column: 48, scope: !53)
!73 = !DILocation(line: 59, column: 56, scope: !53)
!74 = !DILocation(line: 59, column: 12, scope: !53)
!75 = !DILocation(line: 60, column: 15, scope: !53)
!76 = !DILocation(line: 60, column: 12, scope: !53)
!77 = !DILocation(line: 62, column: 3, scope: !53)
!78 = !DILocation(line: 62, column: 36, scope: !53)
!79 = !DILocation(line: 62, column: 45, scope: !53)
!80 = !DILocation(line: 63, column: 1, scope: !53)
!81 = distinct !DISubprogram(name: "svp_simple_029_001_isr_1", scope: !8, file: !8, line: 71, type: !9, scopeLine: 71, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 72, column: 7, scope: !81)
!83 = !DILocation(line: 72, column: 46, scope: !81)
!84 = !DILocation(line: 73, column: 44, scope: !81)
!85 = !DILocation(line: 74, column: 5, scope: !81)
!86 = !DILocation(line: 75, column: 13, scope: !81)
!87 = !DILocation(line: 76, column: 3, scope: !81)
!88 = !DILocation(line: 77, column: 45, scope: !81)
!89 = !DILocation(line: 78, column: 5, scope: !81)
!90 = !DILocation(line: 78, column: 42, scope: !81)
!91 = !DILocation(line: 80, column: 1, scope: !81)
