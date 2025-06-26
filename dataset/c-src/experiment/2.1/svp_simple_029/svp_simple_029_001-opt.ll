; ModuleID = 'svp_simple_029_001-opt.bc'
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
  br label %1, !dbg !10

1:                                                ; preds = %3, %0
  %.0.i = phi i32 [ 0, %0 ], [ %8, %3 ], !dbg !13
  %2 = icmp slt i32 %.0.i, 4096, !dbg !14
  br i1 %2, label %3, label %svp_simple_029_001_init.exit, !dbg !15

3:                                                ; preds = %1
  %4 = call i32 (...) @rand() #3, !dbg !16
  %5 = trunc i32 %4 to i8, !dbg !16
  %6 = sext i32 %.0.i to i64, !dbg !17
  %7 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %6, !dbg !17
  store volatile i8 %5, i8* %7, align 1, !dbg !18, !tbaa !19
  %8 = add nsw i32 %.0.i, 1, !dbg !22
  br label %1, !dbg !15, !llvm.loop !23

svp_simple_029_001_init.exit:                     ; preds = %1
  store volatile i8 -1, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !25, !tbaa !19
  call void (...) @init() #3, !dbg !26
  store void (i32, i8)* @svp_simple_029_001_SetTmData, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !27, !tbaa !30
  store i8 (i32)* @svp_simple_029_001_GetTmData, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !32, !tbaa !30
  store void (i32, i8, i8)* @svp_simple_029_001_SetSelfCtrlFlag, void (i32, i8, i8)** @svp_simple_029_001_ptr_SetSelfCtrlFlag, align 8, !dbg !33, !tbaa !30
  br i1 true, label %9, label %11, !dbg !34

9:                                                ; preds = %svp_simple_029_001_init.exit
  %10 = load void (i32, i8, i8)*, void (i32, i8, i8)** @svp_simple_029_001_ptr_SetSelfCtrlFlag, align 8, !dbg !35, !tbaa !30
  call void %10(i32 36, i8 zeroext -1, i8 zeroext 0), !dbg !35
  br label %11, !dbg !36

11:                                               ; preds = %9, %svp_simple_029_001_init.exit
  ret void, !dbg !37
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_init() #0 !dbg !11 {
  br label %1, !dbg !38

1:                                                ; preds = %9, %0
  %.0 = phi i32 [ 0, %0 ], [ %10, %9 ], !dbg !39
  %2 = icmp slt i32 %.0, 4096, !dbg !40
  br i1 %2, label %4, label %3, !dbg !41

3:                                                ; preds = %1
  br label %11

4:                                                ; preds = %1
  %5 = call i32 (...) @rand(), !dbg !42
  %6 = trunc i32 %5 to i8, !dbg !42
  %7 = sext i32 %.0 to i64, !dbg !43
  %8 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %7, !dbg !43
  store volatile i8 %6, i8* %8, align 1, !dbg !44, !tbaa !19
  br label %9, !dbg !45

9:                                                ; preds = %4
  %10 = add nsw i32 %.0, 1, !dbg !46
  br label %1, !dbg !41, !llvm.loop !47

11:                                               ; preds = %3
  store volatile i8 -1, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !48, !tbaa !19
  call void (...) @init(), !dbg !49
  ret void, !dbg !50
}

declare i32 @rand(...) #2

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_TmOrgFuncMap() #0 !dbg !28 {
  store void (i32, i8)* @svp_simple_029_001_SetTmData, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !51, !tbaa !30
  store i8 (i32)* @svp_simple_029_001_GetTmData, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !52, !tbaa !30
  store void (i32, i8, i8)* @svp_simple_029_001_SetSelfCtrlFlag, void (i32, i8, i8)** @svp_simple_029_001_ptr_SetSelfCtrlFlag, align 8, !dbg !53, !tbaa !30
  ret void, !dbg !54
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_SetTmData(i32 %0, i8 zeroext %1) #0 !dbg !55 {
  %3 = zext i32 %0 to i64, !dbg !56
  %4 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %3, !dbg !56
  store volatile i8 %1, i8* %4, align 1, !dbg !57, !tbaa !19
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define zeroext i8 @svp_simple_029_001_GetTmData(i32 %0) #0 !dbg !59 {
  %2 = zext i32 %0 to i64, !dbg !60
  %3 = getelementptr inbounds [4096 x i8], [4096 x i8]* @svp_simple_029_001_tm_blocks, i64 0, i64 %2, !dbg !60
  %4 = load volatile i8, i8* %3, align 1, !dbg !60, !tbaa !19
  ret i8 %4, !dbg !61
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_SetSelfCtrlFlag(i32 %0, i8 zeroext %1, i8 zeroext %2) #0 !dbg !62 {
  %4 = zext i8 %1 to i32, !dbg !63
  %5 = icmp sgt i32 %4, 128, !dbg !64
  br i1 %5, label %6, label %7, !dbg !63

6:                                                ; preds = %3
  br label %8, !dbg !65

7:                                                ; preds = %3
  br label %8

8:                                                ; preds = %7, %6
  %.0 = phi i8 [ 1, %6 ], [ 0, %7 ], !dbg !66
  %9 = zext i8 %2 to i32, !dbg !67
  %10 = zext i8 %.0 to i32, !dbg !68
  %11 = shl i32 %10, %9, !dbg !68
  %12 = trunc i32 %11 to i8, !dbg !68
  %13 = trunc i32 undef to i8, !dbg !69
  %14 = load i8 (i32)*, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !70, !tbaa !30
  %15 = call zeroext i8 %14(i32 %0), !dbg !70
  %16 = load i8 (i32)*, i8 (i32)** @svp_simple_029_001_ptr_GetTmData, align 8, !dbg !71, !tbaa !30
  %17 = add i32 %0, 1, !dbg !72
  %18 = call zeroext i8 %16(i32 %17), !dbg !71
  %19 = zext i8 %18 to i32, !dbg !71
  %20 = zext i8 %15 to i32, !dbg !73
  %21 = add nsw i32 %20, %19, !dbg !73
  %22 = trunc i32 %21 to i8, !dbg !73
  %23 = zext i8 %12 to i32, !dbg !74
  %24 = zext i8 %22 to i32, !dbg !75
  %25 = or i32 %24, %23, !dbg !75
  %26 = trunc i32 %25 to i8, !dbg !75
  %27 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !76, !tbaa !30
  call void %27(i32 %0, i8 zeroext %26), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nounwind uwtable
define void @svp_simple_029_001_isr_1() #0 !dbg !78 {
  %1 = load volatile i8, i8* @svp_simple_029_001_average_adjust_flag, align 1, !dbg !79, !tbaa !19
  %2 = zext i8 %1 to i32, !dbg !79
  %3 = icmp eq i32 %2, 255, !dbg !80
  br i1 %3, label %4, label %9, !dbg !79

4:                                                ; preds = %0
  %5 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !81, !tbaa !19
  %6 = add i8 %5, 1, !dbg !81
  store volatile i8 %6, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !81, !tbaa !19
  %7 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !82, !tbaa !30
  %8 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !83, !tbaa !19
  call void %7(i32 36, i8 zeroext %8), !dbg !82
  br label %12, !dbg !84

9:                                                ; preds = %0
  store volatile i8 0, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !85, !tbaa !19
  %10 = load void (i32, i8)*, void (i32, i8)** @svp_simple_029_001_ptr_SetTmData, align 8, !dbg !86, !tbaa !30
  %11 = load volatile i8, i8* @svp_simple_029_001_average_adjust_count, align 1, !dbg !87, !tbaa !19
  call void %10(i32 36, i8 zeroext %11), !dbg !86
  br label %12

12:                                               ; preds = %9, %4
  ret void, !dbg !88
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
!10 = !DILocation(line: 44, column: 8, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_029_001_init", scope: !8, file: !8, line: 43, type: !9, scopeLine: 43, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 36, column: 3, scope: !7)
!13 = !DILocation(line: 0, scope: !11, inlinedAt: !12)
!14 = !DILocation(line: 44, column: 21, scope: !11, inlinedAt: !12)
!15 = !DILocation(line: 44, column: 3, scope: !11, inlinedAt: !12)
!16 = !DILocation(line: 45, column: 39, scope: !11, inlinedAt: !12)
!17 = !DILocation(line: 45, column: 5, scope: !11, inlinedAt: !12)
!18 = !DILocation(line: 45, column: 37, scope: !11, inlinedAt: !12)
!19 = !{!20, !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C/C++ TBAA"}
!22 = !DILocation(line: 44, column: 30, scope: !11, inlinedAt: !12)
!23 = distinct !{!23, !15, !24}
!24 = !DILocation(line: 46, column: 3, scope: !11, inlinedAt: !12)
!25 = !DILocation(line: 47, column: 42, scope: !11, inlinedAt: !12)
!26 = !DILocation(line: 49, column: 3, scope: !11, inlinedAt: !12)
!27 = !DILocation(line: 53, column: 36, scope: !28, inlinedAt: !29)
!28 = distinct !DISubprogram(name: "svp_simple_029_001_TmOrgFuncMap", scope: !8, file: !8, line: 52, type: !9, scopeLine: 52, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!29 = distinct !DILocation(line: 37, column: 3, scope: !7)
!30 = !{!31, !31, i64 0}
!31 = !{!"any pointer", !20, i64 0}
!32 = !DILocation(line: 54, column: 36, scope: !28, inlinedAt: !29)
!33 = !DILocation(line: 55, column: 42, scope: !28, inlinedAt: !29)
!34 = !DILocation(line: 39, column: 7, scope: !7)
!35 = !DILocation(line: 40, column: 5, scope: !7)
!36 = !DILocation(line: 41, column: 3, scope: !7)
!37 = !DILocation(line: 42, column: 1, scope: !7)
!38 = !DILocation(line: 44, column: 8, scope: !11)
!39 = !DILocation(line: 0, scope: !11)
!40 = !DILocation(line: 44, column: 21, scope: !11)
!41 = !DILocation(line: 44, column: 3, scope: !11)
!42 = !DILocation(line: 45, column: 39, scope: !11)
!43 = !DILocation(line: 45, column: 5, scope: !11)
!44 = !DILocation(line: 45, column: 37, scope: !11)
!45 = !DILocation(line: 46, column: 3, scope: !11)
!46 = !DILocation(line: 44, column: 30, scope: !11)
!47 = distinct !{!47, !41, !45}
!48 = !DILocation(line: 47, column: 42, scope: !11)
!49 = !DILocation(line: 49, column: 3, scope: !11)
!50 = !DILocation(line: 50, column: 1, scope: !11)
!51 = !DILocation(line: 53, column: 36, scope: !28)
!52 = !DILocation(line: 54, column: 36, scope: !28)
!53 = !DILocation(line: 55, column: 42, scope: !28)
!54 = !DILocation(line: 56, column: 1, scope: !28)
!55 = distinct !DISubprogram(name: "svp_simple_029_001_SetTmData", scope: !8, file: !8, line: 82, type: !9, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 83, column: 3, scope: !55)
!57 = !DILocation(line: 83, column: 41, scope: !55)
!58 = !DILocation(line: 84, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "svp_simple_029_001_GetTmData", scope: !8, file: !8, line: 79, type: !9, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 80, column: 10, scope: !59)
!61 = !DILocation(line: 80, column: 3, scope: !59)
!62 = distinct !DISubprogram(name: "svp_simple_029_001_SetSelfCtrlFlag", scope: !8, file: !8, line: 57, type: !9, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 63, column: 7, scope: !62)
!64 = !DILocation(line: 63, column: 17, scope: !62)
!65 = !DILocation(line: 65, column: 3, scope: !62)
!66 = !DILocation(line: 0, scope: !62)
!67 = !DILocation(line: 69, column: 12, scope: !62)
!68 = !DILocation(line: 69, column: 8, scope: !62)
!69 = !DILocation(line: 71, column: 8, scope: !62)
!70 = !DILocation(line: 73, column: 14, scope: !62)
!71 = !DILocation(line: 74, column: 15, scope: !62)
!72 = !DILocation(line: 74, column: 56, scope: !62)
!73 = !DILocation(line: 74, column: 12, scope: !62)
!74 = !DILocation(line: 75, column: 15, scope: !62)
!75 = !DILocation(line: 75, column: 12, scope: !62)
!76 = !DILocation(line: 77, column: 3, scope: !62)
!77 = !DILocation(line: 78, column: 1, scope: !62)
!78 = distinct !DISubprogram(name: "svp_simple_029_001_isr_1", scope: !8, file: !8, line: 86, type: !9, scopeLine: 86, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 87, column: 7, scope: !78)
!80 = !DILocation(line: 87, column: 46, scope: !78)
!81 = !DILocation(line: 88, column: 44, scope: !78)
!82 = !DILocation(line: 89, column: 5, scope: !78)
!83 = !DILocation(line: 90, column: 13, scope: !78)
!84 = !DILocation(line: 91, column: 3, scope: !78)
!85 = !DILocation(line: 92, column: 45, scope: !78)
!86 = !DILocation(line: 93, column: 5, scope: !78)
!87 = !DILocation(line: 93, column: 42, scope: !78)
!88 = !DILocation(line: 95, column: 1, scope: !78)
