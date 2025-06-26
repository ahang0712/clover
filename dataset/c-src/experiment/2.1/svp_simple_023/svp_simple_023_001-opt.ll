; ModuleID = 'svp_simple_023_001-opt.bc'
source_filename = "./svp_simple_023_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_023_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_main() #0 !dbg !7 {
  %1 = call i32 (...) @rand() #2, !dbg !10
  store volatile i32 %1, i32* @svp_simple_023_001_global_var, align 4, !dbg !13, !tbaa !14
  call void (...) @init() #2, !dbg !18
  %2 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !19, !tbaa !14
  %3 = icmp sgt i32 %2, 0, !dbg !20
  br i1 %3, label %4, label %svp_simple_023_001_func_1.exit, !dbg !23

4:                                                ; preds = %0
  %5 = icmp slt i32 %2, 12, !dbg !24
  br i1 %5, label %6, label %svp_simple_023_001_func_1.exit, !dbg !25

6:                                                ; preds = %4
  %7 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !26, !tbaa !14
  %8 = add nsw i32 %7, 1, !dbg !27
  store volatile i32 %8, i32* @svp_simple_023_001_global_var, align 4, !dbg !28, !tbaa !14
  br label %svp_simple_023_001_func_1.exit, !dbg !29

svp_simple_023_001_func_1.exit:                   ; preds = %0, %4, %6
  ret void, !dbg !30
}

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_func_1(i32 %0) #0 !dbg !21 {
  %2 = icmp sgt i32 %0, 0, !dbg !31
  br i1 %2, label %3, label %8, !dbg !32

3:                                                ; preds = %1
  %4 = icmp slt i32 %0, 12, !dbg !33
  br i1 %4, label %5, label %8, !dbg !34

5:                                                ; preds = %3
  %6 = load volatile i32, i32* @svp_simple_023_001_global_var, align 4, !dbg !35, !tbaa !14
  %7 = add nsw i32 %6, 1, !dbg !36
  store volatile i32 %7, i32* @svp_simple_023_001_global_var, align 4, !dbg !37, !tbaa !14
  br label %8, !dbg !38

8:                                                ; preds = %5, %3, %1
  ret void, !dbg !39
}

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_init() #0 !dbg !11 {
  %1 = call i32 (...) @rand(), !dbg !40
  store volatile i32 %1, i32* @svp_simple_023_001_global_var, align 4, !dbg !41, !tbaa !14
  call void (...) @init(), !dbg !42
  ret void, !dbg !43
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_023_001_isr_1() #0 !dbg !44 {
  store volatile i32 0, i32* @svp_simple_023_001_global_var, align 4, !dbg !45, !tbaa !14
  ret void, !dbg !46
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_023_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_023")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_023_001_main", scope: !8, file: !8, line: 23, type: !9, scopeLine: 23, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_023_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_023")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 28, column: 35, scope: !11, inlinedAt: !12)
!11 = distinct !DISubprogram(name: "svp_simple_023_001_init", scope: !8, file: !8, line: 27, type: !9, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = distinct !DILocation(line: 24, column: 3, scope: !7)
!13 = !DILocation(line: 28, column: 33, scope: !11, inlinedAt: !12)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 30, column: 3, scope: !11, inlinedAt: !12)
!19 = !DILocation(line: 25, column: 29, scope: !7)
!20 = !DILocation(line: 34, column: 11, scope: !21, inlinedAt: !22)
!21 = distinct !DISubprogram(name: "svp_simple_023_001_func_1", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = distinct !DILocation(line: 25, column: 3, scope: !7)
!23 = !DILocation(line: 34, column: 15, scope: !21, inlinedAt: !22)
!24 = !DILocation(line: 34, column: 22, scope: !21, inlinedAt: !22)
!25 = !DILocation(line: 34, column: 7, scope: !21, inlinedAt: !22)
!26 = !DILocation(line: 35, column: 37, scope: !21, inlinedAt: !22)
!27 = !DILocation(line: 35, column: 67, scope: !21, inlinedAt: !22)
!28 = !DILocation(line: 35, column: 35, scope: !21, inlinedAt: !22)
!29 = !DILocation(line: 36, column: 3, scope: !21, inlinedAt: !22)
!30 = !DILocation(line: 26, column: 1, scope: !7)
!31 = !DILocation(line: 34, column: 11, scope: !21)
!32 = !DILocation(line: 34, column: 15, scope: !21)
!33 = !DILocation(line: 34, column: 22, scope: !21)
!34 = !DILocation(line: 34, column: 7, scope: !21)
!35 = !DILocation(line: 35, column: 37, scope: !21)
!36 = !DILocation(line: 35, column: 67, scope: !21)
!37 = !DILocation(line: 35, column: 35, scope: !21)
!38 = !DILocation(line: 36, column: 3, scope: !21)
!39 = !DILocation(line: 37, column: 1, scope: !21)
!40 = !DILocation(line: 28, column: 35, scope: !11)
!41 = !DILocation(line: 28, column: 33, scope: !11)
!42 = !DILocation(line: 30, column: 3, scope: !11)
!43 = !DILocation(line: 31, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "svp_simple_023_001_isr_1", scope: !8, file: !8, line: 38, type: !9, scopeLine: 38, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 39, column: 33, scope: !44)
!46 = !DILocation(line: 40, column: 1, scope: !44)
