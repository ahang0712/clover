; ModuleID = 'svp_simple_301_001.bc'
source_filename = "./svp_simple_301_001.c"
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
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !13
  %3 = load i32, i32* %2, align 4, !dbg !17, !tbaa !13
  %4 = icmp ne i32 %3, 0, !dbg !17
  br i1 %4, label %7, label %5, !dbg !18

5:                                                ; preds = %1
  br label %6, !dbg !19

6:                                                ; preds = %5
  call void @reach_error(), !dbg !20
  call void @abort() #4, !dbg !21
  unreachable, !dbg !21

7:                                                ; preds = %1
  ret void, !dbg !22
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @isr_ldv_assert(i32 %0) #0 !dbg !23 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !13
  %3 = load i32, i32* %2, align 4, !dbg !24, !tbaa !13
  %4 = icmp ne i32 %3, 0, !dbg !24
  br i1 %4, label %7, label %5, !dbg !25

5:                                                ; preds = %1
  br label %6, !dbg !26

6:                                                ; preds = %5
  call void @reach_error(), !dbg !27
  call void @abort() #4, !dbg !28
  unreachable, !dbg !28

7:                                                ; preds = %1
  ret void, !dbg !29
}

; Function Attrs: nounwind uwtable
define void @svp_simple_301_001_isr_1(i8* %0) #0 !dbg !30 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !31
  store i32 6, i32* @pdev, align 4, !dbg !33, !tbaa !13
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define i32 @module_init() #0 !dbg !35 {
  %1 = alloca i32, align 4
  store i32 1, i32* @pdev, align 4, !dbg !36, !tbaa !13
  %2 = load i32, i32* @pdev, align 4, !dbg !37, !tbaa !13
  %3 = icmp eq i32 %2, 1, !dbg !38
  %4 = zext i1 %3 to i32, !dbg !38
  call void @ldv_assert(i32 %4), !dbg !39
  %5 = call i32 @__VERIFIER_nondet_int(), !dbg !40
  %6 = icmp ne i32 %5, 0, !dbg !40
  br i1 %6, label %7, label %11, !dbg !40

7:                                                ; preds = %0
  store i32 2, i32* @pdev, align 4, !dbg !41, !tbaa !13
  %8 = load i32, i32* @pdev, align 4, !dbg !42, !tbaa !13
  %9 = icmp eq i32 %8, 2, !dbg !43
  %10 = zext i1 %9 to i32, !dbg !43
  call void @ldv_assert(i32 %10), !dbg !44
  store i32 0, i32* %1, align 4, !dbg !45
  br label %15, !dbg !45

11:                                               ; preds = %0
  store i32 3, i32* @pdev, align 4, !dbg !46, !tbaa !13
  %12 = load i32, i32* @pdev, align 4, !dbg !47, !tbaa !13
  %13 = icmp eq i32 %12, 3, !dbg !48
  %14 = zext i1 %13 to i32, !dbg !48
  call void @ldv_assert(i32 %14), !dbg !49
  store i32 -1, i32* %1, align 4, !dbg !50
  br label %15, !dbg !50

15:                                               ; preds = %11, %7
  %16 = load i32, i32* %1, align 4, !dbg !51
  ret i32 %16, !dbg !51
}

declare i32 @__VERIFIER_nondet_int() #1

; Function Attrs: nounwind uwtable
define void @module_exit() #0 !dbg !52 {
  %1 = alloca i8*, align 8
  %2 = bitcast i8** %1 to i8*, !dbg !53
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #5, !dbg !53
  store i32 5, i32* @pdev, align 4, !dbg !54, !tbaa !13
  %3 = load i32, i32* @pdev, align 4, !dbg !55, !tbaa !13
  %4 = icmp eq i32 %3, 5, !dbg !56
  %5 = zext i1 %4 to i32, !dbg !56
  call void @ldv_assert(i32 %5), !dbg !57
  %6 = bitcast i8** %1 to i8*, !dbg !58
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %6) #5, !dbg !58
  ret void, !dbg !58
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_301_001_main() #0 !dbg !59 {
  %1 = call i32 @module_init(), !dbg !60
  %2 = icmp ne i32 %1, 0, !dbg !61
  br i1 %2, label %3, label %4, !dbg !60

3:                                                ; preds = %0
  br label %4, !dbg !62

4:                                                ; preds = %3, %0
  call void @module_exit(), !dbg !63
  call void @module_exit(), !dbg !64
  ret i32 0, !dbg !65
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_301_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_301_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 4, column: 22, scope: !7)
!11 = !DILocation(line: 4, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "ldv_assert", scope: !8, file: !8, line: 6, type: !9, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 6, column: 40, scope: !12)
!18 = !DILocation(line: 6, column: 39, scope: !12)
!19 = !DILocation(line: 6, column: 52, scope: !12)
!20 = !DILocation(line: 6, column: 62, scope: !12)
!21 = !DILocation(line: 6, column: 76, scope: !12)
!22 = !DILocation(line: 6, column: 88, scope: !12)
!23 = distinct !DISubprogram(name: "isr_ldv_assert", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = !DILocation(line: 7, column: 44, scope: !23)
!25 = !DILocation(line: 7, column: 43, scope: !23)
!26 = !DILocation(line: 7, column: 56, scope: !23)
!27 = !DILocation(line: 7, column: 66, scope: !23)
!28 = !DILocation(line: 7, column: 80, scope: !23)
!29 = !DILocation(line: 7, column: 92, scope: !23)
!30 = distinct !DISubprogram(name: "svp_simple_301_001_isr_1", scope: !8, file: !8, line: 11, type: !9, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!31 = !{!32, !32, i64 0}
!32 = !{!"any pointer", !15, i64 0}
!33 = !DILocation(line: 12, column: 9, scope: !30)
!34 = !DILocation(line: 13, column: 1, scope: !30)
!35 = distinct !DISubprogram(name: "module_init", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 16, column: 9, scope: !35)
!37 = !DILocation(line: 17, column: 15, scope: !35)
!38 = !DILocation(line: 17, column: 19, scope: !35)
!39 = !DILocation(line: 17, column: 4, scope: !35)
!40 = !DILocation(line: 18, column: 7, scope: !35)
!41 = !DILocation(line: 19, column: 12, scope: !35)
!42 = !DILocation(line: 20, column: 18, scope: !35)
!43 = !DILocation(line: 20, column: 22, scope: !35)
!44 = !DILocation(line: 20, column: 7, scope: !35)
!45 = !DILocation(line: 21, column: 7, scope: !35)
!46 = !DILocation(line: 23, column: 9, scope: !35)
!47 = !DILocation(line: 24, column: 15, scope: !35)
!48 = !DILocation(line: 24, column: 19, scope: !35)
!49 = !DILocation(line: 24, column: 4, scope: !35)
!50 = !DILocation(line: 25, column: 4, scope: !35)
!51 = !DILocation(line: 26, column: 1, scope: !35)
!52 = distinct !DISubprogram(name: "module_exit", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 29, column: 4, scope: !52)
!54 = !DILocation(line: 30, column: 9, scope: !52)
!55 = !DILocation(line: 31, column: 15, scope: !52)
!56 = !DILocation(line: 31, column: 19, scope: !52)
!57 = !DILocation(line: 31, column: 4, scope: !52)
!58 = !DILocation(line: 32, column: 1, scope: !52)
!59 = distinct !DISubprogram(name: "svp_simple_301_001_main", scope: !8, file: !8, line: 34, type: !9, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 35, column: 8, scope: !59)
!61 = !DILocation(line: 35, column: 22, scope: !59)
!62 = !DILocation(line: 38, column: 4, scope: !59)
!63 = !DILocation(line: 40, column: 5, scope: !59)
!64 = !DILocation(line: 41, column: 5, scope: !59)
!65 = !DILocation(line: 42, column: 5, scope: !59)
