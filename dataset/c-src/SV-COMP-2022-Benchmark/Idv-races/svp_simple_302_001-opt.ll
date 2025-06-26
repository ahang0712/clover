; ModuleID = 'svp_simple_302_001-opt.bc'
source_filename = "./svp_simple_302_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@pdev = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @ldv_assert(i32 %0) #0 !dbg !12 {
  %2 = icmp ne i32 %0, 0, !dbg !13
  br i1 %2, label %6, label %3, !dbg !14

3:                                                ; preds = %1
  br label %4, !dbg !15

4:                                                ; preds = %3
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !16
  call void @abort() #5, !dbg !18
  unreachable, !dbg !18

6:                                                ; preds = %1
  ret void, !dbg !19
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @svp_simple_302_001_isr_1(i8* %0) #0 !dbg !20 {
  store i32 6, i32* @pdev, align 4, !dbg !21, !tbaa !22
  ret void, !dbg !26
}

; Function Attrs: nounwind uwtable
define i32 @module_init() #0 !dbg !27 {
  store i32 1, i32* @pdev, align 4, !dbg !28, !tbaa !22
  %1 = load i32, i32* @pdev, align 4, !dbg !29, !tbaa !22
  %2 = icmp eq i32 %1, 1, !dbg !30
  %3 = zext i1 %2 to i32, !dbg !30
  br i1 %2, label %ldv_assert.exit, label %4, !dbg !31

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !33
  call void @abort() #6, !dbg !35
  unreachable, !dbg !35

ldv_assert.exit:                                  ; preds = %0
  %6 = call i32 @__VERIFIER_nondet_int(), !dbg !36
  %7 = icmp ne i32 %6, 0, !dbg !36
  br i1 %7, label %8, label %14, !dbg !36

8:                                                ; preds = %ldv_assert.exit
  store i32 2, i32* @pdev, align 4, !dbg !37, !tbaa !22
  %9 = load i32, i32* @pdev, align 4, !dbg !38, !tbaa !22
  %10 = icmp eq i32 %9, 2, !dbg !39
  %11 = zext i1 %10 to i32, !dbg !39
  br i1 %10, label %ldv_assert.exit1, label %12, !dbg !40

12:                                               ; preds = %8
  %13 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !42
  call void @abort() #6, !dbg !44
  unreachable, !dbg !44

ldv_assert.exit1:                                 ; preds = %8
  br label %20, !dbg !45

14:                                               ; preds = %ldv_assert.exit
  store i32 3, i32* @pdev, align 4, !dbg !46, !tbaa !22
  %15 = load i32, i32* @pdev, align 4, !dbg !47, !tbaa !22
  %16 = icmp eq i32 %15, 3, !dbg !48
  %17 = zext i1 %16 to i32, !dbg !48
  br i1 %16, label %ldv_assert.exit2, label %18, !dbg !49

18:                                               ; preds = %14
  %19 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !51
  call void @abort() #6, !dbg !53
  unreachable, !dbg !53

ldv_assert.exit2:                                 ; preds = %14
  br label %20, !dbg !54

20:                                               ; preds = %ldv_assert.exit2, %ldv_assert.exit1
  %.0 = phi i32 [ 0, %ldv_assert.exit1 ], [ -1, %ldv_assert.exit2 ], !dbg !55
  ret i32 %.0, !dbg !56
}

declare i32 @__VERIFIER_nondet_int() #1

; Function Attrs: nounwind uwtable
define void @module_exit() #0 !dbg !57 {
  store i32 5, i32* @pdev, align 4, !dbg !58, !tbaa !22
  %1 = load i32, i32* @pdev, align 4, !dbg !59, !tbaa !22
  %2 = icmp eq i32 %1, 5, !dbg !60
  %3 = zext i1 %2 to i32, !dbg !60
  br i1 %2, label %ldv_assert.exit, label %4, !dbg !61

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !63
  call void @abort() #6, !dbg !65
  unreachable, !dbg !65

ldv_assert.exit:                                  ; preds = %0
  ret void, !dbg !66
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_302_001_main() #0 !dbg !67 {
  store i32 1, i32* @pdev, align 4, !dbg !68, !tbaa !22
  %1 = load i32, i32* @pdev, align 4, !dbg !70, !tbaa !22
  %2 = icmp eq i32 %1, 1, !dbg !71
  %3 = zext i1 %2 to i32, !dbg !71
  br i1 %2, label %ldv_assert.exit.i, label %4, !dbg !72

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !74
  call void @abort() #6, !dbg !76
  unreachable, !dbg !76

ldv_assert.exit.i:                                ; preds = %0
  %6 = call i32 @__VERIFIER_nondet_int() #4, !dbg !77
  %7 = icmp ne i32 %6, 0, !dbg !77
  br i1 %7, label %8, label %14, !dbg !77

8:                                                ; preds = %ldv_assert.exit.i
  store i32 2, i32* @pdev, align 4, !dbg !78, !tbaa !22
  %9 = load i32, i32* @pdev, align 4, !dbg !79, !tbaa !22
  %10 = icmp eq i32 %9, 2, !dbg !80
  %11 = zext i1 %10 to i32, !dbg !80
  br i1 %10, label %ldv_assert.exit1.i, label %12, !dbg !81

12:                                               ; preds = %8
  %13 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !83
  call void @abort() #6, !dbg !85
  unreachable, !dbg !85

ldv_assert.exit1.i:                               ; preds = %8
  br label %module_init.exit, !dbg !86

14:                                               ; preds = %ldv_assert.exit.i
  store i32 3, i32* @pdev, align 4, !dbg !87, !tbaa !22
  %15 = load i32, i32* @pdev, align 4, !dbg !88, !tbaa !22
  %16 = icmp eq i32 %15, 3, !dbg !89
  %17 = zext i1 %16 to i32, !dbg !89
  br i1 %16, label %ldv_assert.exit2.i, label %18, !dbg !90

18:                                               ; preds = %14
  %19 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !92
  call void @abort() #6, !dbg !94
  unreachable, !dbg !94

ldv_assert.exit2.i:                               ; preds = %14
  br label %module_init.exit, !dbg !95

module_init.exit:                                 ; preds = %ldv_assert.exit1.i, %ldv_assert.exit2.i
  %.0.i = phi i32 [ 0, %ldv_assert.exit1.i ], [ -1, %ldv_assert.exit2.i ], !dbg !96
  %20 = icmp ne i32 %.0.i, 0, !dbg !97
  br i1 %20, label %21, label %27, !dbg !98

21:                                               ; preds = %module_init.exit
  store i32 5, i32* @pdev, align 4, !dbg !99, !tbaa !22
  %22 = load i32, i32* @pdev, align 4, !dbg !101, !tbaa !22
  %23 = icmp eq i32 %22, 5, !dbg !102
  %24 = zext i1 %23 to i32, !dbg !102
  br i1 %23, label %module_exit.exit, label %25, !dbg !103

25:                                               ; preds = %21
  %26 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !105
  call void @abort() #6, !dbg !107
  unreachable, !dbg !107

module_exit.exit:                                 ; preds = %21
  br label %27, !dbg !108

27:                                               ; preds = %module_exit.exit, %module_init.exit
  store i32 5, i32* @pdev, align 4, !dbg !109, !tbaa !22
  %28 = load i32, i32* @pdev, align 4, !dbg !111, !tbaa !22
  %29 = icmp eq i32 %28, 5, !dbg !112
  %30 = zext i1 %29 to i32, !dbg !112
  br i1 %29, label %module_exit.exit3, label %31, !dbg !113

31:                                               ; preds = %27
  %32 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !115
  call void @abort() #6, !dbg !117
  unreachable, !dbg !117

module_exit.exit3:                                ; preds = %27
  store i32 5, i32* @pdev, align 4, !dbg !118, !tbaa !22
  %33 = load i32, i32* @pdev, align 4, !dbg !120, !tbaa !22
  %34 = icmp eq i32 %33, 5, !dbg !121
  %35 = zext i1 %34 to i32, !dbg !121
  br i1 %34, label %module_exit.exit5, label %36, !dbg !122

36:                                               ; preds = %module_exit.exit3
  %37 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !124
  call void @abort() #6, !dbg !126
  unreachable, !dbg !126

module_exit.exit5:                                ; preds = %module_exit.exit3
  ret i32 0, !dbg !127
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_302_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_302_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 3, column: 22, scope: !7)
!11 = !DILocation(line: 3, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "ldv_assert", scope: !8, file: !8, line: 5, type: !9, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 5, column: 40, scope: !12)
!14 = !DILocation(line: 5, column: 39, scope: !12)
!15 = !DILocation(line: 5, column: 52, scope: !12)
!16 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 5, column: 62, scope: !12)
!18 = !DILocation(line: 5, column: 76, scope: !12)
!19 = !DILocation(line: 5, column: 88, scope: !12)
!20 = distinct !DISubprogram(name: "svp_simple_302_001_isr_1", scope: !8, file: !8, line: 10, type: !9, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 11, column: 9, scope: !20)
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C/C++ TBAA"}
!26 = !DILocation(line: 12, column: 1, scope: !20)
!27 = distinct !DISubprogram(name: "module_init", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!28 = !DILocation(line: 15, column: 9, scope: !27)
!29 = !DILocation(line: 16, column: 15, scope: !27)
!30 = !DILocation(line: 16, column: 19, scope: !27)
!31 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !32)
!32 = distinct !DILocation(line: 16, column: 4, scope: !27)
!33 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !34)
!34 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !32)
!35 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !32)
!36 = !DILocation(line: 17, column: 7, scope: !27)
!37 = !DILocation(line: 18, column: 12, scope: !27)
!38 = !DILocation(line: 19, column: 18, scope: !27)
!39 = !DILocation(line: 19, column: 22, scope: !27)
!40 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !41)
!41 = distinct !DILocation(line: 19, column: 7, scope: !27)
!42 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !43)
!43 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !41)
!44 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !41)
!45 = !DILocation(line: 20, column: 7, scope: !27)
!46 = !DILocation(line: 23, column: 9, scope: !27)
!47 = !DILocation(line: 24, column: 15, scope: !27)
!48 = !DILocation(line: 24, column: 19, scope: !27)
!49 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !50)
!50 = distinct !DILocation(line: 24, column: 4, scope: !27)
!51 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !52)
!52 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !50)
!53 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !50)
!54 = !DILocation(line: 25, column: 4, scope: !27)
!55 = !DILocation(line: 0, scope: !27)
!56 = !DILocation(line: 26, column: 1, scope: !27)
!57 = distinct !DISubprogram(name: "module_exit", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 30, column: 9, scope: !57)
!59 = !DILocation(line: 31, column: 15, scope: !57)
!60 = !DILocation(line: 31, column: 19, scope: !57)
!61 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !62)
!62 = distinct !DILocation(line: 31, column: 4, scope: !57)
!63 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !64)
!64 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !62)
!65 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !62)
!66 = !DILocation(line: 32, column: 1, scope: !57)
!67 = distinct !DISubprogram(name: "svp_simple_302_001_main", scope: !8, file: !8, line: 34, type: !9, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 15, column: 9, scope: !27, inlinedAt: !69)
!69 = distinct !DILocation(line: 35, column: 8, scope: !67)
!70 = !DILocation(line: 16, column: 15, scope: !27, inlinedAt: !69)
!71 = !DILocation(line: 16, column: 19, scope: !27, inlinedAt: !69)
!72 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !73)
!73 = distinct !DILocation(line: 16, column: 4, scope: !27, inlinedAt: !69)
!74 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !75)
!75 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !73)
!76 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !73)
!77 = !DILocation(line: 17, column: 7, scope: !27, inlinedAt: !69)
!78 = !DILocation(line: 18, column: 12, scope: !27, inlinedAt: !69)
!79 = !DILocation(line: 19, column: 18, scope: !27, inlinedAt: !69)
!80 = !DILocation(line: 19, column: 22, scope: !27, inlinedAt: !69)
!81 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !82)
!82 = distinct !DILocation(line: 19, column: 7, scope: !27, inlinedAt: !69)
!83 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !84)
!84 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !82)
!85 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !82)
!86 = !DILocation(line: 20, column: 7, scope: !27, inlinedAt: !69)
!87 = !DILocation(line: 23, column: 9, scope: !27, inlinedAt: !69)
!88 = !DILocation(line: 24, column: 15, scope: !27, inlinedAt: !69)
!89 = !DILocation(line: 24, column: 19, scope: !27, inlinedAt: !69)
!90 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !91)
!91 = distinct !DILocation(line: 24, column: 4, scope: !27, inlinedAt: !69)
!92 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !93)
!93 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !91)
!94 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !91)
!95 = !DILocation(line: 25, column: 4, scope: !27, inlinedAt: !69)
!96 = !DILocation(line: 0, scope: !27, inlinedAt: !69)
!97 = !DILocation(line: 35, column: 22, scope: !67)
!98 = !DILocation(line: 35, column: 8, scope: !67)
!99 = !DILocation(line: 30, column: 9, scope: !57, inlinedAt: !100)
!100 = distinct !DILocation(line: 36, column: 7, scope: !67)
!101 = !DILocation(line: 31, column: 15, scope: !57, inlinedAt: !100)
!102 = !DILocation(line: 31, column: 19, scope: !57, inlinedAt: !100)
!103 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !104)
!104 = distinct !DILocation(line: 31, column: 4, scope: !57, inlinedAt: !100)
!105 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !106)
!106 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !104)
!107 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !104)
!108 = !DILocation(line: 37, column: 4, scope: !67)
!109 = !DILocation(line: 30, column: 9, scope: !57, inlinedAt: !110)
!110 = distinct !DILocation(line: 38, column: 5, scope: !67)
!111 = !DILocation(line: 31, column: 15, scope: !57, inlinedAt: !110)
!112 = !DILocation(line: 31, column: 19, scope: !57, inlinedAt: !110)
!113 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !114)
!114 = distinct !DILocation(line: 31, column: 4, scope: !57, inlinedAt: !110)
!115 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !116)
!116 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !114)
!117 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !114)
!118 = !DILocation(line: 30, column: 9, scope: !57, inlinedAt: !119)
!119 = distinct !DILocation(line: 39, column: 5, scope: !67)
!120 = !DILocation(line: 31, column: 15, scope: !57, inlinedAt: !119)
!121 = !DILocation(line: 31, column: 19, scope: !57, inlinedAt: !119)
!122 = !DILocation(line: 5, column: 39, scope: !12, inlinedAt: !123)
!123 = distinct !DILocation(line: 31, column: 4, scope: !57, inlinedAt: !119)
!124 = !DILocation(line: 3, column: 22, scope: !7, inlinedAt: !125)
!125 = distinct !DILocation(line: 5, column: 62, scope: !12, inlinedAt: !123)
!126 = !DILocation(line: 5, column: 76, scope: !12, inlinedAt: !123)
!127 = !DILocation(line: 40, column: 5, scope: !67)
